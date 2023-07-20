import SwiftUI
import Foundation
import SceneKit
import GLTFSceneKit


class CustomizeAvatarLoader : AvatarLoaderBase
{
//    static let shared = CustomizeAvatarLoader()
//    override init(){}
 
    //Set Model parent node where models will be added as child to show in scene
    public func SetupNodeInScene(closure:()->Void)
    {
        if(ModelParentNode == nil)
        {
            ModelParentNode = SCNNode()
            AvatarYugData.shared.sceneView?.rootNode.addChildNode(ModelParentNode)
            ModelParentNode.worldPosition = SCNVector3(0,0,0)
        }
        if(CustomizeModelParent == nil)
        {
            CustomizeModelParent = SCNNode()
            ModelParentNode.addChildNode(CustomizeModelParent)
            CustomizeModelParent.worldPosition = SCNVector3(0,0,0)
        }
        if(headNode == nil)
        {
            headNode = SCNNode()
            CustomizeModelParent.addChildNode(headNode)
            headNode.worldPosition = SCNVector3(0,0,0)
        }
        if(boneAnimationList.count <= 0)
        {
            do
            {
                let sceneSource = try GLTFSceneSource(path: "Standard_idle.glb",options: [.animationImportPolicy:10])
                let idleanimscene = try sceneSource.scene()
                LoadAnimationFromBone(_bone: idleanimscene.rootNode)
            }
            catch
            {
                print("\(error.localizedDescription)")
                return
            }
        }
        closure()
    }
    
    
    //This method add model data to queue to load models in proper sequence to avoid data loss
    public func LoadNetworkModel( modelData : GetEconomyItemsResultDataInner , undo :Bool)
    {
        if(!undo)
        {
            //UndoHandler.shared.AddProChangeAction(_propitem: modelData)
            networkModelQueueList.append(modelData)
            OnQueueNetworkModel()
        }
        else
        {
            networkModelQueueList.append(modelData)
            OnQueueNetworkModel()
        }
    }
}
