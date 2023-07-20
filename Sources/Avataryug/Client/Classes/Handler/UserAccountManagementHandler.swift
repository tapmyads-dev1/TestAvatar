//
//  UserAccountManagementAPIHandler.swift
//  AvatarPluginiOSCore
//
//  Created by Developer1 on 21/02/23.
//

import Foundation

/// <summary>
/// The "UserAccountManagementHandle" class manages user account-related operations through the use of the "Base" class.
/// It provides a variety of methods for tasks such as
/// changing passwords, deleting user accounts, updating user demographics, verifying users with email, and more.
/// These methods utilize the "baseApiCall" instance to make API calls and handle responses and errors through callbacks.
/// </summary>
class UserAccountManagementHandler
{
    var ApiBase:Base
    
    init(ApiBase: Base)
    {
        self.ApiBase = ApiBase
    }
    
    /// <summary>
    /// Allows users to change their password.
    /// </summary>
    func ChangePassword(completionHandler:@escaping(Result<ChangePasswordResult,Error>) -> Void)
    {
        ApiBase.CallApi(completionHandler: { (response) in
            switch response
            {
                case .success(let result):
                    completionHandler(.success(result as! ChangePasswordResult ))
                case .failure(let error):
                    completionHandler(.failure(error))
            }
        })
    }
    
    /// <summary>
    /// Deletes a user account.
    /// </summary>
    func DeleteUser(completionHandler:@escaping(Result<DeleteUserResult,Error>) -> Void)
    {
        ApiBase.CallApi(completionHandler: { (response) in
            switch response
            {
            case .success(let result):
                completionHandler(.success(result as! DeleteUserResult ))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        })
    }
    
    /// <summary>
    /// Updates user demographic information.
    /// </summary>
    func UpdateUserDemographics(completionHandler:@escaping(Result<UpdateUserDemographicsResult,Error>) -> Void)
    {
        ApiBase.CallApi(completionHandler: { (response) in
            switch response
            {
            case .success(let result):
                completionHandler(.success(result as! UpdateUserDemographicsResult ))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        })
    }
    
    /// <summary>
    /// Verifies a user's email address.
    /// </summary>
    func VerifyUserWithEmail(completionHandler:@escaping(Result<VerifyUserWithEmailResult,Error>)-> Void)
    {
        ApiBase.CallApi { response in
            switch response {
            case .success(let result):
                completionHandler(.success(result as! VerifyUserWithEmailResult ))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    
    /// <summary>
    /// Updates the user's email and password.
    /// </summary>
    func UpdateEmailPassword(completionHandler:@escaping(Result<UpdateEmailPasswordResult,Error>)-> Void)
    {
        ApiBase.CallApi {  response in
            switch response {
            case .success(let result):
                completionHandler(.success(result as! UpdateEmailPasswordResult ))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    
    /// <summary>
    /// Sends an account verification email to the user.
    /// </summary>
    func SendAccountVerificationEmail(completionHandler:@escaping(Result<SendAccountVerificationEmailResult,Error>)-> Void)
    {
        ApiBase.CallApi { response in
            switch response {
            case .success(let result):
                completionHandler(.success(result as! SendAccountVerificationEmailResult ))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    
    /// <summary>
    /// Sends an account recovery email to the user.
    /// </summary>
    func SendAccountRecoveryEmail(completionHandler:@escaping(Result<SendAccountRecoveryEmailResult,Error>)->Void)
    {
        ApiBase.CallApi
        {
            response in
            switch response {
            case .success(let success):
                completionHandler(.success(success as! SendAccountRecoveryEmailResult))
            case .failure(let failure):
                completionHandler(.failure(failure))
            }
        }
    }
    
    /// <summary>
    /// Adds an email and password to the user's account.
    /// </summary>
    func AddEmailPassword(completionHandler:@escaping(Result<AddEmailPasswordResult,Error>) -> Void)
    {
        ApiBase.CallApi(completionHandler: { (response) in
            switch response
            {
            case .success(let result):
                completionHandler(.success(result as! AddEmailPasswordResult ))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        })
    }
         
    /// <summary>
    /// Adds the specified generic service identifier to the user's Avataryug account.
    /// This is designed to allow for a Avataryug ID lookup of any arbitrary service identifier a Project wants to add.
    /// This identifier should never be used as authentication credentials, as the intent is that it is easily accessible by other users.
    /// </summary>
    func AddGenericServiceID(completionHandler:@escaping(Result<AddGenericServiceIDResult,Error>) -> Void)
    {
        ApiBase.CallApi(completionHandler: { (response) in
            switch response
            {
            case .success(let result):
                completionHandler(.success(result as! AddGenericServiceIDResult ))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        })
    }
    

    // <summary>
    /// Retrieves information about the user's account.
    /// </summary>
    func GetUserAccountInfo(completionHandler:@escaping(Result<GetUserAccountInfoResult,Error>) -> Void)
    {
        ApiBase.CallApi(completionHandler: { (response) in
            switch response
            {
            case .success(let result):
                completionHandler(.success(result as! GetUserAccountInfoResult ))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        })
    }
    
    /// <summary>
    /// Retrieves the user's public profile information.
    /// </summary>
    func GetUserProfile(completionHandler:@escaping(Result<GetUserProfileResult,Error>) -> Void)
    {
        ApiBase.CallApi(completionHandler: { (response) in
            switch response
            {
            case .success(let result):
                completionHandler(.success(result as! GetUserProfileResult ))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        })
    }

    /// <summary>
    /// Links an Android device ID to the user's account.
    /// </summary>
    func LinkAndroidDeviceID(completionHandler:@escaping(Result<LinkAndroidDeviceIDResult,Error>) -> Void)
    {
        ApiBase.CallApi(completionHandler: { (response) in
            switch response
            {
            case .success(let result):
                completionHandler(.success(result as! LinkAndroidDeviceIDResult ))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        })
    }
    
    /// <summary>
    /// Links an Apple account to the user's account.
    /// </summary>
    func LinkApple(completionHandler:@escaping(Result<LinkAppleResult,Error>) -> Void)
    {
        ApiBase.CallApi(completionHandler: { (response) in
            switch response
            {
            case .success(let result):
                completionHandler(.success(result as! LinkAppleResult ))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        })
    }
    
    /// <summary>
    /// Links a custom ID to the user's account.
    /// </summary>
    func LinkCustomID(completionHandler:@escaping(Result<LinkCustomIDResult,Error>) -> Void)
    {
        ApiBase.CallApi(completionHandler: { (response) in
            switch response
            {
            case .success(let result):
                completionHandler(.success(result as! LinkCustomIDResult ))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        })
    }
    
    /// <summary>
    /// Links a Facebook account to the user's account.
    /// </summary>
    func LinkFacebookAccount(completionHandler:@escaping(Result<LinkFacebookAccountResult,Error>) -> Void)
    {
        ApiBase.CallApi(completionHandler: { (response) in
            switch response
            {
            case .success(let result):
                completionHandler(.success(result as! LinkFacebookAccountResult ))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        })
    }
    
    /// <summary>
    /// Links a Google account to the user's account.
    /// </summary>
    func LinkGoogleAccount(completionHandler:@escaping(Result<LinkGoogleAccountResult,Error>) -> Void)
    {
        ApiBase.CallApi(completionHandler: { (response) in
            switch response
            {
            case .success(let result):
                completionHandler(.success(result as! LinkGoogleAccountResult ))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        })
    }
    
    /// <summary>
    /// Links an iOS device ID to the user's account.
    /// </summary>
    func LinkIOSDeviceID(completionHandler:@escaping(Result<LinkIOSDeviceIDResult,Error>) -> Void)
    {
        ApiBase.CallApi(completionHandler: { (response) in
            switch response
            {
            case .success(let result):
                completionHandler(.success(result as! LinkIOSDeviceIDResult ))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        })
    }
    
    /// <summary>
    /// Removes a generic service ID from the user's account.
    /// </summary>
    func RemoveGenericServiceID(completionHandler:@escaping(Result<RemoveGenericServiceIDResult,Error>) -> Void)
    {
        ApiBase.CallApi(completionHandler: { (response) in
            switch response
            {
            case .success(let result):
                completionHandler(.success(result as! RemoveGenericServiceIDResult ))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        })
    }
    
    /// <summary>
    /// Unlinks an Android device ID from the user's account.
    /// </summary>
    func UnlinkAndroidDeviceID(completionHandler:@escaping(Result<UnlinkAndroidDeviceIDResult,Error>) -> Void)
    {
        ApiBase.CallApi(completionHandler: { (response) in
            switch response
            {
            case .success(let result):
                completionHandler(.success(result as! UnlinkAndroidDeviceIDResult ))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        })
    }
    
    /// <summary>
    /// Unlinks an Apple account from the user's account.
    /// </summary>
    func UnlinkApple(completionHandler:@escaping(Result<UnlinkAppleResult,Error>) -> Void)
    {
        ApiBase.CallApi(completionHandler: { (response) in
            switch response
            {
            case .success(let result):
                completionHandler(.success(result as! UnlinkAppleResult ))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        })
    }
    
    /// <summary>
    /// Unlinks a custom ID from the user's account.
    /// </summary>
    func UnlinkCustomID(completionHandler:@escaping(Result<UnlinkCustomIDResult,Error>) -> Void)
    {
        ApiBase.CallApi(completionHandler: { (response) in
            switch response
            {
            case .success(let result):
                completionHandler(.success(result as! UnlinkCustomIDResult ))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        })
    }
    
    /// <summary>
    /// Unlinks a Facebook account from the user's account.
    /// </summary>
    func UnlinkFacebookAccount(completionHandler:@escaping(Result<UnlinkFacebookAccountResult,Error>) -> Void)
    {
        ApiBase.CallApi(completionHandler: { (response) in
            switch response
            {
            case .success(let result):
                completionHandler(.success(result as! UnlinkFacebookAccountResult ))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        })
    }
    
    /// <summary>
    /// Unlinks a Google account from the user's account.
    /// </summary>
    func UnlinkGoogleAccount(completionHandler:@escaping(Result<UnlinkGoogleAccountResult,Error>) -> Void)
    {
        ApiBase.CallApi(completionHandler: { (response) in
            switch response
            {
            case .success(let result):
                completionHandler(.success(result as! UnlinkGoogleAccountResult ))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        })
    }
    
    /// <summary>
    /// Unlinks an iOS device ID from the user's account.
    /// </summary>
    func UnlinkIOSDeviceID(completionHandler:@escaping(Result<UnlinkIOSDeviceIDResult,Error>) -> Void)
    {
        ApiBase.CallApi(completionHandler: { (response) in
            switch response
            {
            case .success(let result):
                completionHandler(.success(result as! UnlinkIOSDeviceIDResult ))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        })
    }
    func UpdateAvatarUrl(completionHandler:@escaping(Result<UpdateAvatarUrlResult,Error>) -> Void)
    {
        ApiBase.CallApi(completionHandler: { (response) in
            switch response
            {
            case .success(let result):
                completionHandler(.success(result as! UpdateAvatarUrlResult ))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        })
    }
    func UpdateImageAvatarUrl(completionHandler:@escaping(Result<UpdateImageAvatarUrlResult,Error>) -> Void)
    {
        ApiBase.CallApi(completionHandler: { (response) in
            switch response
            {
            case .success(let result):
                completionHandler(.success(result as! UpdateImageAvatarUrlResult ))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        })
    }
    
    
    /// <summary>
    /// Updates the display name of the user in the project.
    /// </summary>
    func UpdateUserProjectDisplayName(completionHandler:@escaping(Result<UpdateUserProjectDisplayNameResult,Error>) -> Void)
    {
        ApiBase.CallApi(completionHandler: { (response) in
            switch response
            {
            case .success(let result):
                completionHandler(.success(result as! UpdateUserProjectDisplayNameResult ))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        })
    }

    /// <summary>
    /// Updates the default avatar ID for the user.
    /// </summary>
    func UpdateDefaultAvatarID(completionHandler:@escaping(Result<UpdateDefaultAvatarIDResult,Error>) -> Void)
    {
        ApiBase.CallApi(completionHandler: { (response) in
            switch response
            {
            case .success(let result):
                completionHandler(.success(result as! UpdateDefaultAvatarIDResult ))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        })
    }

}



/// <summary>
///Allows users to change their password.
/// </summary>

class ChangePassword:Base
{
    public var newPassword:String
    public var oldPassword:String
    init(oldPassword:String, newPassword:String)
    {
        self.oldPassword = oldPassword
        self.newPassword = newPassword
    }
    func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void)
    {
        let changePasswordRequest = ChangePasswordRequest(oldPassword:oldPassword,newPassword: newPassword )
        UserAccountManagementAPI.changePassword(changePasswordRequest: changePasswordRequest)
        {
            (response, error) in
            guard error == nil else
            {
                print(error!)
                completionHandler(.failure(error!))
                return
            }
            do
            {
                completionHandler(.success(response! as AnyObject))
            }
        }
    }
}

/// <summary>
/// Delete User Account from Avataryug platform.
/// </summary>
class DeleteUser:Base
{

    func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void)
    {
        UserAccountManagementAPI.deleteUser()
        {
            (response, error) in
            guard error == nil else
            {
                print(error!)
                completionHandler(.failure(error!))
                return
            }
            do
            {
                completionHandler(.success(response! as AnyObject))
            }
        }
    }
}


/// <summary>
/// Updates user demographic information.
/// </summary>
class UpdateUserDemographics:Base
{
    public var gender:String
    public var ageRange:String
    public var race:String
    
    init(gender:String,ageRange:String,race:String)
    {
        self.gender = gender
        self.ageRange = ageRange
        self.race = race
    }
    
    func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void)
    {
        let updateUserDemographicsRequest = UpdateUserDemographicsRequest(gender: gender,ageRange: ageRange,race: race)
        UserAccountManagementAPI.updateUserDemographics(updateUserDemographicsRequest: updateUserDemographicsRequest)
        {
            (response, error) in
            guard error == nil else
            {
                print(error!)
                completionHandler(.failure(error!))
                return
            }
            do
            {
                completionHandler(.success(response! as AnyObject))
            }
        }
    }
}

/// <summary>
/// Verifies user account status to email verified once email verification is done
/// </summary>
class VerifyUserWithEmail:Base
{
    public var userID:String
    public var verificationCode:String
    init(userID:String, verificationCode:String)
    {
        self.userID = userID
        self.verificationCode = verificationCode
    }

    func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void)
    {
        let verifyuserWithEmailReq = VerifyUserWithEmailRequest(userID: userID, verificationCode: verificationCode)

        UserAccountManagementAPI.verifyUserWithEmail(verifyUserWithEmailRequest:verifyuserWithEmailReq )
        {
            response, error in
            guard error == nil else
            {
                print(error!)
                completionHandler(.failure(error!))
                return
            }
            do
            {
                completionHandler(.success(response! as AnyObject))
            }
        }
    }
}

/// <summary>
/// Updates the user's email and password.
/// </summary>
class UpdateEmailPassword:Base
{
    public var emailID:String
    public var password:String
    public var verificationCode:String

    init(emailID:String, password:String,verificationCode:String)
    {
        self.emailID = emailID
        self.password = password
        self.verificationCode = verificationCode
    }

    func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void)
    {
        let updateEmailReq = UpdateEmailPasswordRequest(emailID: emailID,password: password, verificationCode: verificationCode)
        UserAccountManagementAPI.updateEmailPassword(updateEmailPasswordRequest: updateEmailReq)
        {
            response, error in
            guard error == nil else
            {
                print(error!)
                completionHandler(.failure(error!))
                return
            }
            do
            {
                completionHandler(.success(response! as AnyObject))
            }
        }
    }
}

/// <summary>
/// Sends an account verification email to the user.
/// </summary>
class SendAccountVerificationEmail:Base
{
    public var emailID:String

    init(emailID:String)
    {
        self.emailID = emailID
    }
    func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void)
    {
        let sendAccountVerifyReq = SendAccountVerificationEmailRequest(emailID: emailID)

        UserAccountManagementAPI.sendAccountVerificationEmail(sendAccountVerificationEmailRequest: sendAccountVerifyReq)
        {
            response, error in
            guard error == nil else
            {
                print(error!)
                completionHandler(.failure(error!))
                return
            }
            do
            {
                completionHandler(.success(response! as AnyObject))
            }
        }
    }
}
    
/// <summary>
/// Sends an account recovery email to the user.
/// </summary>
class SendAccountRecoveryEmail:Base
{
    public var emailID:String

    init(emailID:String)
    {
        self.emailID = emailID
    }

    func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void)
    {
        let auth = SendAccountRecoveryEmailRequset(emailID: emailID)

        UserAccountManagementAPI.sendAccountRecoveryEmail(sendAccountRecoveryEmailRequset: auth)
        {
            data, error in
            guard error == nil else
            {
                print(error!)
                completionHandler(.failure(error!))
                return
            }
            do
            {
                completionHandler(.success(data! as AnyObject))
            }
        }
    }
}

/// <summary>
/// Adds an email and password to the user's account.
/// </summary>
class AddEmailPassword:Base
{
    public var emailID: String
    public var password: String
    
    init(emailID: String,password: String)
    {
        self.emailID = emailID
        self.password = password
    }
    
    func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void)
    {
        let addEmailPasswordRequest = AddEmailPasswordRequest(emailID: emailID,password: password)
        UserAccountManagementAPI.addEmailPassword(addEmailPasswordRequest: addEmailPasswordRequest)
        {
            (response, error) in
            guard error == nil else
            {
                print(error!)
                completionHandler(.failure(error!))
                return
            }
            do
            {
                completionHandler(.success(response! as AnyObject))
            }
        }
    }
}

/// <summary>
/// Adds the specified generic service identifier to the user's Avataryug account.
/// This is designed to allow for a Avataryug ID lookup of any arbitrary service identifier a Project wants to add.
/// This identifier should never be used as authentication credentials, as the intent is that it is easily accessible by other users.
/// </summary>
class AddGenericServiceID:Base
{
    public var genericServiceID: String
    
    init(genericServiceID: String)
    {
        self.genericServiceID = genericServiceID
    }
    
    func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void)
    {
        let addGenericServiceIDRequest = AddGenericServiceIDRequest(genericServiceID: genericServiceID)
        UserAccountManagementAPI.addGenericServiceID(addGenericServiceIDRequest: addGenericServiceIDRequest)
        {
            (response, error) in
            guard error == nil else
            {
                print(error!)
                completionHandler(.failure(error!))
                return
            }
            do
            {
                completionHandler(.success(response! as AnyObject))
            }
        }
    }
}

/// <summary>
/// Retrieves information about the user's account.
/// </summary>
class GetUserAccountInfo:Base
{
     
    func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void)
    {
        UserAccountManagementAPI.getUserAccountInfo()
        {
            (response, error) in
            guard error == nil else
            {
                print(error!)
                completionHandler(.failure(error!))
                return
            }
            do
            {
                completionHandler(.success(response! as AnyObject))
            }
        }
    }
}

/// <summary>
/// Retrieves the user's public profile information.
/// </summary>
class GetUserProfile:Base
{
    public var userID: String

    init(userID: String)
    {
        self.userID = userID
    }
    
    func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void)
    {
        UserAccountManagementAPI.getUserProfile(userID: userID)
        {
            (response, error) in
            guard error == nil else
            {
                print(error!)
                completionHandler(.failure(error!))
                return
            }
            do
            {
                completionHandler(.success(response! as AnyObject))
            }
        }
    }
}

/// <summary>
/// Links the Android device identifier to the user's Avataryug account
/// </summary>
class LinkAndroidDeviceID:Base
{
    public var androidDeviceID: String
    public var forceLink: Bool
    init(androidDeviceID: String,forceLink: Bool)
    {
        self.androidDeviceID = androidDeviceID
        self.forceLink = forceLink
    }
    
    func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void){
        let linkAndroidDeviceIDRequest = LinkAndroidDeviceIDRequest(forceLink: forceLink, androidDeviceID: androidDeviceID)
        UserAccountManagementAPI.linkAndroidDeviceID(linkAndroidDeviceIDRequest: linkAndroidDeviceIDRequest){ (response, error) in
            guard error == nil else {
                print(error!)
                completionHandler(.failure(error!))
                return
            }
            do
            {
                completionHandler(.success(response! as AnyObject))
            }
        }
    }
}

/// <summary>
/// Links the Apple account associated with the token to the user's Avataryug account.
/// </summary>
class LinkApple:Base
{
    public var appleID: String
    public var forceLink: Bool
    public var identityToken: String
    init(appleID: String,forceLink: Bool,identityToken:String)
    {
        self.appleID = appleID
        self.forceLink = forceLink
        self.identityToken = identityToken
    }
    
    func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void){
        let linkAppleRequest = LinkAppleRequest(forceLink: forceLink,appleID: appleID)
        UserAccountManagementAPI.linkApple(linkAppleRequest: linkAppleRequest){ (response, error) in
            guard error == nil else {
                print(error!)
                completionHandler(.failure(error!))
                return
            }
            do
            {
                completionHandler(.success(response! as AnyObject))
            }
        }
    }
}

/// <summary>
/// Links the custom identifier, generated by the Project, to the user's Avataryug account
/// </summary>
class LinkCustomID:Base
{
    public var customID: String
    public var forceLink: Bool
    init(customID: String,forceLink: Bool)
    {
        self.customID = customID
        self.forceLink = forceLink
    }
    
    func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void){
        let linkCustomIDRequest = LinkCustomIDRequest(forceLink: forceLink, customID: customID)
        UserAccountManagementAPI.linkCustomID(linkCustomIDRequest: linkCustomIDRequest){ (response, error) in
            guard error == nil else {
                print(error!)
                completionHandler(.failure(error!))
                return
            }
            do
            {
                completionHandler(.success(response! as AnyObject))
            }
        }
    }
}

/// <summary>
/// Links the Facebook account associated with the provided Facebook access token to the user's Avataryug account
/// </summary>
class LinkFacebookAccount:Base
{
    public var accessToken: String
    public var facebookID: String
    public var forceLink: Bool
    init(accessToken: String,forceLink: Bool,facebookID: String)
    {
        self.forceLink = forceLink
        self.accessToken = accessToken
        self.facebookID = facebookID
    }
    
    func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void){
        let linkFacebookAccountRequest = LinkFacebookAccountRequest(forceLink: forceLink,accessToken: accessToken,facebookID: facebookID)
        UserAccountManagementAPI.linkFacebookAccount(linkFacebookAccountRequest: linkFacebookAccountRequest){ (response, error) in
            guard error == nil else {
                print(error!)
                completionHandler(.failure(error!))
                return
            }
            do
            {
                completionHandler(.success(response! as AnyObject))
            }
        }
    }
}

/// <summary>
/// Links the currently signed-in user account to their Google account, using their Google account credentials
/// </summary>
class LinkGoogleAccount:Base
{
    public var googleID: String
    public var googleServerAuthCode: String
    public var forceLink: Bool
    init(googleID: String,forceLink: Bool,googleServerAuthCode: String)
    {
        self.forceLink = forceLink
        self.googleID = googleID
        self.googleServerAuthCode = googleServerAuthCode
    }
    
    func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void){
        let linkGoogleAccountRequest = LinkGoogleAccountRequest(forceLink: forceLink,googleID: googleID, googleServerAuthCode: googleServerAuthCode)
        UserAccountManagementAPI.linkGoogleAccount(linkGoogleAccountRequest: linkGoogleAccountRequest){ (response, error) in
            guard error == nil else {
                print(error!)
                completionHandler(.failure(error!))
                return
            }
            do
            {
                completionHandler(.success(response! as AnyObject))
            }
        }
    }
}

/// <summary>
/// Links the vendor-specific iOS device identifier to the user's Avataryug account
/// </summary>
class LinkIOSDeviceID:Base
{
    public var deviceID: String
    public var forceLink: Bool
    init(deviceID: String,forceLink: Bool)
    {
        self.forceLink = forceLink
        self.deviceID = deviceID
    }
    
    func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void){
        let linkIOSDeviceIDRequest = LinkIOSDeviceIDRequest(forceLink: forceLink, deviceID: deviceID)
        UserAccountManagementAPI.linkIOSDeviceID(linkIOSDeviceIDRequest: linkIOSDeviceIDRequest){ (response, error) in
            guard error == nil else {
                print(error!)
                completionHandler(.failure(error!))
                return
            }
            do
            {
                completionHandler(.success(response! as AnyObject))
            }
        }
    }
}

/// <summary>
/// Removes the generic service identifier from the user's Avataryug account.
/// </summary>
class RemoveGenericServiceID:Base
{
    func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void)
    {
        UserAccountManagementAPI.removeGenericServiceID()
        {
            (response, error) in
            guard error == nil else
            {
                print(error!)
                completionHandler(.failure(error!))
                return
            }
            do
            {
                completionHandler(.success(response! as AnyObject))
            }
        }
    }
}

/// <summary>
/// Unlinks the related Android device identifier from the user's Avataryug account
/// </summary>
class UnlinkAndroidDeviceID:Base
{
    func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void){
        UserAccountManagementAPI.unlinkAndroidDeviceID(){ (response, error) in
            guard error == nil else {
                print(error!)
                completionHandler(.failure(error!))
                return
            }
            do
            {
                completionHandler(.success(response! as AnyObject))
            }
        }
    }
}

/// <summary>
/// Unlinks the related Apple account from the user's Avataryug account.
/// </summary>
class UnlinkApple:Base
{
    func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void){
        UserAccountManagementAPI.unlinkApple(){ (response, error) in
            guard error == nil else {
                print(error!)
                completionHandler(.failure(error!))
                return
            }
            do
            {
                completionHandler(.success(response! as AnyObject))
            }
        }
    }
}

/// <summary>
/// Unlinks the related custom identifier from the user's Avataryug account
/// </summary>
class UnlinkCustomID:Base
{
    func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void){
        UserAccountManagementAPI.unlinkCustomID(){ (response, error) in
            guard error == nil else {
                print(error!)
                completionHandler(.failure(error!))
                return
            }
            do
            {
                completionHandler(.success(response! as AnyObject))
            }
        }
    }
}

/// <summary>
/// Unlinks the related Facebook account from the user's Avataryug account
/// </summary>
class UnlinkFacebookAccount:Base
{
    func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void){
        UserAccountManagementAPI.unlinkFacebookAccount(){ (response, error) in
            guard error == nil else {
                print(error!)
                completionHandler(.failure(error!))
                return
            }
            do
            {
                completionHandler(.success(response! as AnyObject))
            }
        }
    }
}

/// <summary>
/// Unlinks the related Google account from the user's Avataryug account
/// </summary>
class UnlinkGoogleAccount:Base
{
    func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void){
        UserAccountManagementAPI.unlinkGoogleAccount(){ (response, error) in
            guard error == nil else {
                print(error!)
                completionHandler(.failure(error!))
                return
            }
            do
            {
                completionHandler(.success(response! as AnyObject))
            }
        }
    }
}

/// <summary>
/// Unlinks the related iOS device identifier from the user's Avataryug account
/// </summary>
class UnlinkIOSDeviceID:Base
{
    func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void){
        UserAccountManagementAPI.unlinkIOSDeviceID(){ (response, error) in
            guard error == nil else {
                print(error!)
                completionHandler(.failure(error!))
                return
            }
            do
            {
                completionHandler(.success(response! as AnyObject))
            }
        }
    }
}

/// <summary>
/// Updates the display name for the user in the project
/// </summary>
class UpdateUserProjectDisplayName:Base
{
    public var displayName: String

    init(displayName: String)
    {
        self.displayName = displayName
    }

    func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void)
    {
        let updateUserProjectDisplayNameRequest = UpdateUserProjectDisplayNameRequest(displayName: displayName)
        UserAccountManagementAPI.updateUserProjectDisplayName(updateUserProjectDisplayNameRequest:updateUserProjectDisplayNameRequest)
        {
            (response, error) in
            guard error == nil else
            {
                print(error!)
                completionHandler(.failure(error!))
                return
            }
            do
            {
                completionHandler(.success(response! as AnyObject))
            }
        }
    }
}

/// <summary>
/// Sets the default avatar ID to users account
/// </summary>
class UpdateDefaultAvatarID:Base
{
    public var defualtAvatarID:String

    init(defualtAvatarID:String)
    {
        self.defualtAvatarID = defualtAvatarID
    }

    func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void)
    {
        let request = UpdateDefaultAvatarIDRequest(defaultAvatarID: defualtAvatarID)

        UserAccountManagementAPI.updateDefaultAvatarID(updateDefaultAvatarIDRequest: request)
        {
            data, error in
            guard error == nil else
            {
                print(error!)
                completionHandler(.failure(error!))
                return
            }
            do
            {
                completionHandler(.success(data! as AnyObject))
            }
        }
    }
}
