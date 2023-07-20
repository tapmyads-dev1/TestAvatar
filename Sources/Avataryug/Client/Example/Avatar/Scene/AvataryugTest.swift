import SwiftUI
import SceneKit

// This is Example Scene
// Login and it will load default models
// Example button will add change models
struct AvataryugTest: View {
    
    @State private var isLoginComplete = false
    @State private var customizeAvatar = CustomizeAvatarLoader()

    var body: some View {
        if(isLoginComplete)
        {
            ZStack
            {
                VStack
                {
                    SceneView(scene:AvatarYugData.shared.sceneView, options: [.autoenablesDefaultLighting,.allowsCameraControl])
                    HStack
                    {
                        
                    }
                    Rectangle()
                        .fill(Color.white)
                        .frame(width:UIScreen.main.bounds.width,height: 50)
                        .overlay
                    {
                        HStack
                        {
                            Button
                            {
                                LoadCategoryItems(cat: "Top", completionHandler: {
                                    
                                })
                            }
                            label:
                            {
                                Text("Top")
                                    .frame(width: 100, height: 40)
                                    .font(.headline)
                                    .background(Color.white)
                                    .foregroundColor(.black)
                                    .shadow(radius: 1)
                                    .padding(3)
                            }.cornerRadius(1)
                                .frame( height: 5)
                            
                            Button
                            {
                            
                                LoadCategoryItems(cat: "Bottom", completionHandler: {
                                    
                                })
                              
                            }
                            label:
                            {
                                Text("Bottom")
                                    .frame(width: 100, height: 40)
                                    .font(.headline)
                                    .background(Color.white)
                                    .foregroundColor(.black)
                                    .shadow(radius: 1)
                                    .padding(3)
                            }.cornerRadius(1)
                                .frame( height: 5)
                            
                            Button
                            {
                                var text = "For additional categories, please refer to the demo project or consult the documentation for more information";
                                ApiEvents.shared.ShowNotificationMessage(message: text)
                            }
                            label:
                            {
                                Text("More")
                                    .frame(width: 100, height: 40)
                                    .font(.headline)
                                    .background(Color.white)
                                    .foregroundColor(.black)
                                    .shadow(radius: 1)
                                    .padding(3)
                            }.cornerRadius(1)
                                .frame( height: 5)
                        }
                    }
                }
            }.onAppear
            {
                customizeAvatar.SetupNodeInScene
                {
                    customizeAvatar.LoadHeadModel
                    {
                        customizeAvatar.ResetToCurrent()
                    }
                }
            }
        }
        else
        {
            ZStack
            {
                Rectangle()
                    .fill(.gray)
              
                    VStack
                    {
                        Text("Avataryug")
                            .font(.system(size: 40))
                            .background(Color.clear)
                            .foregroundColor(.black)
                            .shadow(color: .white, radius: 2,x: 2,y: 1)
                        Text("SDK")
                            .font(.system(size: 20))
                            .background(Color.clear)
                            .foregroundColor(.black)
                            .shadow(color: .white, radius: 2,x: 2,y: 1)
                        Spacer()
                    }
                
                    VStack
                    {
                        Spacer()
                        Button
                        {
                            ApiEvents.shared.ShowLoading()
                            let auth = AuthenticateHandler(ApiBase: LoginWithCustomID(customID: "q2", createAccount: true))
                            auth.LoginWithCustomID(completionHandler:
                                                    {
                                (response) in
                                switch response
                                {
                                case .success(let success):
                                    print(success)
                                    isLoginComplete = true
                                    ApiEvents.shared.HideLoading()
                                case .failure(let failure):
                                    print(failure)
                                }
                            })
                            
                        }
                    label:
                        {
                            Text("Login")
                                .frame(width: UIScreen.main.bounds.width, height: 40)
                                .font(.headline)
                                .background(Color.white)
                                .foregroundColor(.black)
                            
                        }
                        .shadow(radius: 1)
                        .frame( height: 5)
                    }
                
                
            }
            
        }
       
    }
    
    func LoadCategoryItems(cat :String ,completionHandler:@escaping() -> Void)
    {
        var gender = 1
        if(customizeAvatar.GetGender() == .Female)
        {
            gender = 2
        }
        if(customizeAvatar.GetGender() == .Male)
        {
            gender = 1
        }
        if(AvatarYugData.shared.IsCommonGender(category: cat)!)
        {
            gender = 3
        }

        let loadeconomy = EconomyHandler(ApiBase: GetEconomyItems(category: cat, status: 1, gender: gender))

        loadeconomy.GetEconomyItems(completionHandler:
        {
            (response) in
            switch response
            {
            case .success(let success):
                if(success.data!.count>0)
                {
                    let randomInt = Int.random(in: 0..<success.data!.count)
                    customizeAvatar.LoadNetworkModel(modelData: success.data![randomInt], undo: false)
                    completionHandler()
                }
                else
                {
                    completionHandler()
                }
            case .failure(let failure):
                print(failure)
                ApiEvents.shared.HideLoading()
                ApiEvents.shared.ShowNotificationMessage(message: failure.localizedDescription)
            }
        })
    }
}

struct AvataryugTest_Previews: PreviewProvider {
    static var previews: some View {
        AvataryugTest()
    }
}
