
import Foundation

class ApiEvents
{
    static let shared = ApiEvents()
    
    private var eventSubscriber : ApiEventSubscriber?
    
    public func SetDelegate(subscriber : ApiEventSubscriber)
    {
        eventSubscriber = subscriber
    }
    
    private init(){}
    
    public func ShowLoading()
    {
        eventSubscriber?.SetLoadingScr(_showLoading: true)
    }
    
    public func HideLoading()
    {
        eventSubscriber?.SetLoadingScr(_showLoading: false)
    }
 
    public func ShowNotificationMessage(message :String)
    {
        eventSubscriber?.ShowSimpleNotification(message: message, showSimpleNot: true)
    }
}

protocol ApiEventSubscriber{
    func SetLoadingScr(_showLoading:Bool)
    func ShowSimpleNotification(message:String,showSimpleNot:Bool)
}
