
import Foundation
import SceneKit

// This method loop throuth all bone of givent model and check morpth target geometry
func GetMorphtargetnode(_bone :SCNNode!,completionHandler:@escaping(SCNNode) -> Void)
{
    if(_bone != nil)
    {
        if(_bone.morpher != nil)
        {
            if((_bone.morpher?.weights.count)! > 0)
            {
                completionHandler(_bone)
            }
        }
    }
    if(_bone.childNodes.count>0)
    {
        for i in 0..._bone.childNodes.count-1
        {
            GetMorphtargetnode(_bone: _bone.childNodes[i],completionHandler: completionHandler);
        }
    }
}
