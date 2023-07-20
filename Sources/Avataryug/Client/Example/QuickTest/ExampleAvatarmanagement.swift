import SwiftUI
/// This ExampleAvatarmanagement Class demonstrates API calling methods with temporary data.
struct ExampleAvatarmanagement: View {
    var body: some View {
        VStack
        {
            CreatedTwoButton(ButtonOnename: "Generate Avatar Mesh", OnClickButtonOne: {
                print("GenerateAvatarMesh")
                ApiEvents.shared.ShowLoading()
                GeneratesAvatarMesh()
            }, ButtonTwoname: "Get Avatar Presets", OnClickButtonTwo: {
                print("GetAvatarPresets")
                ApiEvents.shared.ShowLoading()
                GetAvatarsPresets()
            })
            
            CreatedTwoButton(ButtonOnename: "Get Clips", OnClickButtonOne: {
                print("GetClips")
                ApiEvents.shared.ShowLoading()
                GetClip()
            }, ButtonTwoname: "Get Clips By ids", OnClickButtonTwo: {
                print("GetClipsByids")
                ApiEvents.shared.ShowLoading()
                GetClipByID()
            })
            
            CreatedTwoButton(ButtonOnename: "Get Expressions", OnClickButtonOne: {
                print("GetExpressions")
                ApiEvents.shared.ShowLoading()
                GetExpression()
            }, ButtonTwoname: "Get Expressions By ids", OnClickButtonTwo: {
                print("GetExpressionsByids")
                ApiEvents.shared.ShowLoading()
                GetExpressionByID()
            })
            
            CreatedTwoButton(ButtonOnename: "Get All bucket vertices", OnClickButtonOne: {
                print("GetAllbucketVertices")
                ApiEvents.shared.ShowLoading()
                GetAllBucketsVertices()
            }, ButtonTwoname: "Grant avatarpreset item to user", OnClickButtonTwo: {
                print("Grant avatarpreset item to user")
                ApiEvents.shared.ShowLoading()
                GrantAvatarPresetItemToUser()
            })
            
            CreatedTwoButton(ButtonOnename: "Render Avatar Image", OnClickButtonOne: {
                print("RenderAvatarImage")
                ApiEvents.shared.ShowLoading()
                RenderAvatarsImage()
            }, ButtonTwoname: "Sync Avatar", OnClickButtonTwo: {
                print("SyncAvatar")
                ApiEvents.shared.ShowLoading()
                SyncAvatar()
            })
            
            CreatedTwoButton(ButtonOnename: "Grant Avatar Presets TO USER", OnClickButtonOne: {
                print("GrantAvatarPresets")
                ApiEvents.shared.ShowLoading()
                GrantAvatarPresetsToUser()
            }, ButtonTwoname: "Grant Avatar Presets by id", OnClickButtonTwo: {
                print("GrantAvatarPresetsbyid")
                ApiEvents.shared.ShowLoading()
                GetAvatarsPresetsByID()
            })
        }
    }
    
    ///Generates the 3D mesh as per the configuration in the Config panel
    func GeneratesAvatarMesh()
    {
        let auth = AvatarManagementHandler(ApiBase: GenerateAvatarMesh(_AvatarID: "154ffe8a-d890-4a5f-bf8b-8ef6000b89ce", _Platform: GenerateAvatarMeshRequest.Platform.ios))
        auth.GenerateAvatarMesh { response in
            switch response {
            case .success(let success):
                print("GeneratesAvatarMesh-->>",success)
                ApiEvents.shared.HideLoading()
            case .failure(let failure):
                print("GeneratesAvatarMesh-->>",failure)
                ApiEvents.shared.HideLoading()
            }
        }
    }
    
    ///Get all avatar presets
    func GetAvatarsPresets()
    {
        let auth = AvatarManagementHandler(ApiBase: GetAvatarPresets(status: AvatarManagementAPI.Status_getAvatarPresets._1, gender: AvatarManagementAPI.Gender_getAvatarPresets._3))
        auth.GetAvatarPresets { response in
            switch response {
            case .success(let success):
                print("GetAvatarsPresets-->>",success)
                ApiEvents.shared.HideLoading()
            case .failure(let failure):
                print("GetAvatarsPresets-->>",failure)
                ApiEvents.shared.HideLoading()
            }
        }
    }
    
    ///Get all the clips by Active status.
    func GetClip()
    {
        let auth = AvatarManagementHandler(ApiBase: GetClips(status: AvatarManagementAPI.Status_getClips._1))
        auth.GetClips { response in
            switch response {
            case .success(let success):
                print("GetClip-->>",success)
                ApiEvents.shared.HideLoading()
            case .failure(let failure):
                print("GetClip-->>",failure)
                ApiEvents.shared.HideLoading()
            }
        }
    }
    
    ///Get the specified clip's details by providing ClipID.
    func GetClipByID()
    {
        let auth = AvatarManagementHandler(ApiBase: GetClipsByID(clipId: ""))
        auth.GetClipsByID { response in
            switch response {
            case .success(let success):
                print("GetClipsByID-->>",success)
                ApiEvents.shared.HideLoading()
            case .failure(let failure):
                print("GetClipsByID-->>",failure)
                ApiEvents.shared.HideLoading()
            }
        }
    }
    
    ///Get all the active expressions.
    func GetExpression()
    {
        let auth = AvatarManagementHandler(ApiBase: SDKClientSwift.GetExpression(status: AvatarManagementAPI.Status_getExpressions._1))
        auth.GetExpression { response in
            switch response {
            case .success(let success):
                print("GetExpression-->>",success)
                ApiEvents.shared.HideLoading()
            case .failure(let failure):
                print("GetExpression-->>",failure)
                ApiEvents.shared.HideLoading()
            }
        }
    }
    
    ///Get the specified expression details by providing ExpressionID.
    func GetExpressionByID()
    {
        let auth = AvatarManagementHandler(ApiBase: SDKClientSwift.GetExpressionByID(expressionid: "7c0af41a-c43c-45ff-b61e-2605b079f074"))
        auth.GetExpression { response in
            switch response {
            case .success(let success):
                print("GetExpressionByID-->>",success)
                ApiEvents.shared.HideLoading()
            case .failure(let failure):
                print("GetExpressionByID-->>",failure)
                ApiEvents.shared.HideLoading()
            }
        }
    }
    
    ///Get vertices for all buckets.
    func GetAllBucketsVertices()
    {
        let auth = AvatarManagementHandler(ApiBase: SDKClientSwift.GetGetallbucketvertices(platform: AvatarManagementAPI.Platform_getGetallbucketvertices.ios))
        auth.GetGetallbucketvertices { response in
            switch response {
            case .success(let success):
                print("GetGetallbucketvertices-->>",success)
                ApiEvents.shared.HideLoading()
            case .failure(let failure):
                print("GetGetallbucketvertices-->>",failure)
                ApiEvents.shared.HideLoading()
            }
        }
    }
    
    ///Grant Avatar Preset Items To User.
    func GrantAvatarPresetItemToUser()
    {
        let itemId = ["0474376d-d886-4681-a08a-2c6adbca248e"]
        let auth = AvatarManagementHandler(ApiBase: SDKClientSwift.GrantAvatarPresetItemsToUser(itemID: itemId))
        auth.GetGetallbucketvertices { response in
            switch response {
            case .success(let success):
                print("GrantAvatarPresetItemToUser-->>",success)
                ApiEvents.shared.HideLoading()
            case .failure(let failure):
                print("GrantAvatarPresetItemToUser-->>",failure)
                ApiEvents.shared.HideLoading()
            }
        }
    }
    
    ///Render Avatar Image.
    func RenderAvatarsImage()
    {
        let auth = AvatarManagementHandler(ApiBase: RenderAvatarImage(_AvatarID: "154ffe8a-d890-4a5f-bf8b-8ef6000b89ce", _Platform: RenderAvatarImageRequest.Platform.ios))
        auth.RenderAvatarImage { response in
            switch response {
            case .success(let success):
                print("RenderAvatarsImage-->>",success)
                ApiEvents.shared.HideLoading()
            case .failure(let failure):
                print("RenderAvatarsImage-->>",failure)
                ApiEvents.shared.HideLoading()
            }
        }
    }
    
    ///Creates missing avatars into the mentioned platform for the user.
    func SyncAvatar()
    {
        let auth = AvatarManagementHandler(ApiBase: SyncAvatars(Platform: SyncAvatarsRequest.Platform.ios, Mesh: true, Image: true))
        auth.SyncAvatars { response in
            switch response {
            case .success(let success):
                print("SyncAvatars-->>",success)
                ApiEvents.shared.HideLoading()
            case .failure(let failure):
                print("SyncAvatars-->>",failure)
                ApiEvents.shared.HideLoading()
            }
        }
    }
    
    ///Grant Avatar Preset To User.
    func GrantAvatarPresetsToUser()
    {
        let auth = AvatarManagementHandler(ApiBase: GrantAvatarPresetToUser(avatarData: ""))
        auth.GrantAvatarPresetToUser { response in
            switch response {
            case .success(let success):
                print("GrantAvatarPresetToUser-->>",success)
                ApiEvents.shared.HideLoading()
            case .failure(let failure):
                print("GrantAvatarPresetToUser-->>",failure)
                ApiEvents.shared.HideLoading()
            }
        }
    }
    
    ///Retrive Avatar preset by ID.
    func GetAvatarsPresetsByID()
    {
        let auth = AvatarManagementHandler(ApiBase: GetAvatarPresetsByID(avatarPresetID: "db9e8538-9e50-4328-b8a7-0922a5e0e8d2"))
        auth.GetAvatarPresetsByID { response in
            switch response {
            case .success(let success):
                print("GetAvatarPresetsByID-->>",success)
                ApiEvents.shared.HideLoading()
            case .failure(let failure):
                print("GetAvatarPresetsByID-->>",failure)
                ApiEvents.shared.HideLoading()
            }
        }
    }
}

struct ExampleAvatarmanagement_Previews: PreviewProvider {
    static var previews: some View {
        ExampleAvatarmanagement()
    }
}
