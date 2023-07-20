
import Foundation
import SceneKit
////public func LoadModelData(urlstr : URL,completionHandler: @escaping (Data) -> Void)
////{
////    let task = URLSession.shared.dataTask(with: urlstr)
////    {
////        (data,Urlresponse ,error) in
////        guard let data = data else
////        {
////            return
////        }
////        print(data)
////        completionHandler(data)
////    }
////    task.resume()
////}
//
func LoopAllMesh(_bone :SCNNode!,completionHandler: @escaping (SCNGeometry) -> Void)
{
    if(!_bone.isEqual(nil))
    {
        if let geometry = _bone.geometry {
            if let _ = geometry.firstMaterial{
                completionHandler(geometry)
            }
        }
    }
    if(_bone.childNodes.count>0)
    {
       for i in 0..._bone.childNodes.count-1
       {
           LoopAllMesh(_bone: _bone.childNodes[i],completionHandler: completionHandler);
       }
    }
}
//func LoopAllMorpherMesh(_bone :SCNNode!,completionHandler: @escaping (SCNNode) -> Void)
//{
//    if(!_bone.isEqual(nil))
//    {
//        if let morpher = _bone.morpher {
//            print("***",morpher.targets.count)
//            completionHandler(_bone)
//        }
//    }
//    if(_bone.childNodes.count>0)
//    {
//       for i in 0..._bone.childNodes.count-1
//       {
//           LoopAllMorpherMesh(_bone: _bone.childNodes[i],completionHandler: completionHandler);
//       }
//    }
//}
//func LoopBoneName(_bone :SCNNode!,completionHandler: @escaping (SCNNode) -> Void)
//{
//    if(!_bone.isEqual(nil))
//    {
//        if _bone.name != nil {
//            completionHandler(_bone)
//        }
//    }
//    if(_bone.childNodes.count>0)
//    {
//       for i in 0..._bone.childNodes.count-1
//       {
//           LoopBoneName(_bone: _bone.childNodes[i],completionHandler: completionHandler);
//       }
//    }
//}
