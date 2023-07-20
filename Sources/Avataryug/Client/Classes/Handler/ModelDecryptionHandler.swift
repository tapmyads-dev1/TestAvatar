//
//  ModelDecryptionHandler.swift
//  SDKClientSwift
//
//  Created by Developer1 on 18/07/23.
//

import Foundation
import CommonCrypto

class AESCipher {
    
    private let key: Data
    
    init(key: String) {
        self.key = Data(key.utf8)
    }
    
    func decrypt(data: Data) -> Data? {
        let iv = Data("0123456789123456".utf8)
        let dataToDecrypt = data.dropFirst(16)
        var decryptedData: Data? = nil
        
        dataToDecrypt.withUnsafeBytes { (dataPointer: UnsafeRawBufferPointer) in
            var decryptedBytes = [UInt8](repeating: 0, count: dataToDecrypt.count)
            
            let status = key.withUnsafeBytes { (keyPointer: UnsafeRawBufferPointer) in
                iv.withUnsafeBytes { (ivPointer: UnsafeRawBufferPointer) in
                    CCCrypt(
                        CCOperation(kCCDecrypt),
                        CCAlgorithm(kCCAlgorithmAES),
                        CCOptions(kCCOptionPKCS7Padding),
                        keyPointer.baseAddress,
                        key.count,
                        ivPointer.baseAddress,
                        dataPointer.baseAddress,
                        dataToDecrypt.count,
                        &decryptedBytes,
                        decryptedBytes.count,
                        nil
                    )
                }
            }
            
            if status == kCCSuccess {
                decryptedData = Data(decryptedBytes)
            }
        }
        
        return decryptedData
    }
}

func GetModelData(data:Data,completionHandler: @escaping (Data) -> Void)
{
//    do
//    {
//        let key = "0123456789123456"
//        let cipher =  AESCipher(key: key)
//        let decrypteddata = cipher.decrypt(data: data)
//        let stringData = String(data: decrypteddata!, encoding: .utf8)
//        if let decodedData = Data(base64Encoded: stringData ?? "", options: .ignoreUnknownCharacters)
//        {
//            let  finalData = try decodedData.gunzipped()
//            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//                completionHandler(finalData)
//            }
//        }
//    }
//    catch
//    {
//        ApiEvents.shared.ShowNotificationMessage(message: "Mode Data not In proper format")
//        ApiEvents.shared.HideLoading()
//    }
    do
    {

        
        let keys = Data(stringToByteKey(ProjectSettings.shared.secredkey))
        let ivs = Data(stringToByteKey(ProjectSettings.shared.secrediv))
        
        do
        {
            let decryptedData = try aesDecrypt(data: data, key: keys, iv: ivs)
            completionHandler(decryptedData)
        }
        catch
        {
            print("Error: \(error)")
        }
    }
    catch
    {
        print("Error: \(error)")
    }
}
func stringToByteKey(_ key: String) -> [UInt8] {
    var byteArray = [UInt8]()
    for i in stride(from: 0, to: key.count, by: 2) {
        let startIndex = key.index(key.startIndex, offsetBy: i)
        let endIndex = key.index(startIndex, offsetBy: 2, limitedBy: key.endIndex) ?? key.endIndex
        let byteString = String(key[startIndex..<endIndex])
        if let byte = UInt8(byteString, radix: 16) {
            byteArray.append(byte)
        }
    }
    return byteArray
}
func aesDecrypt(data: Data, key: Data, iv: Data) throws -> Data {
    let bufferSize = data.count + kCCBlockSizeAES128
    var buffer = [UInt8](repeating: 0, count: bufferSize)
    var numBytesDecrypted = 0

    let cryptStatus = key.withUnsafeBytes { keyBytes in
        iv.withUnsafeBytes { ivBytes in
            data.withUnsafeBytes { dataBytes in
                CCCrypt(
                    CCOperation(kCCDecrypt),
                    CCAlgorithm(kCCAlgorithmAES),
                    CCOptions(kCCOptionPKCS7Padding),
                    keyBytes.baseAddress, key.count,
                    ivBytes.baseAddress,
                    dataBytes.baseAddress, data.count,
                    &buffer, bufferSize,
                    &numBytesDecrypted
                )
            }
        }
    }

    guard cryptStatus == kCCSuccess else {
        throw CryptoError.decryptFailed(cryptStatus)
    }

    let decryptedData = Data(bytes: buffer, count: numBytesDecrypted)
    return decryptedData
}

enum CryptoError: Error {
    case decryptFailed(CCStatus)
}
