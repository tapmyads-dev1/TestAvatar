
import Foundation
import SceneKit

func GetMeshNode(_bone :SCNNode!,completionHandler:@escaping(SCNNode) -> Void)
{
    if(_bone != nil)
    {
        if(_bone.geometry?.firstMaterial != nil)
        {
            completionHandler(_bone)
        }
    }
    if(_bone.childNodes.count>0)
    {
        for i in 0..._bone.childNodes.count-1
        {
            GetMeshNode(_bone: _bone.childNodes[i],completionHandler: completionHandler);
        }
    }
}
