//
//  EconomyAPIHandler.swift
//  AvatarPluginiOSCore
//
//  Created by Developer1 on 21/02/23.
//

import Foundation


/// <summary>
/// The "EconomyHandler" class handles bundle containers, currencies, and items for economy-related operations.
/// It utilizes the "Base" class for making API calls and provides methods for managing
/// bundles, currencies, store, and items within the economy system.
/// </summary>
class EconomyHandler
{
    var ApiBase:Base
    
    init(ApiBase: Base)
    {
        self.ApiBase = ApiBase
    }
    
    /// <summary>
    /// Get Economy Bundles by ID
    /// </summary>
    func GetEconomyBundleByID(completionHandler:@escaping(Result<GetEconomyBundleByIDResult,Error>) -> Void)
    {
        ApiBase.CallApi(completionHandler: { (response) in
            switch response
            {
            case .success(let result):
                completionHandler(.success(result as! GetEconomyBundleByIDResult ))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        })
    }
    
    /// <summary>
    /// Get Economy Bundles
    /// </summary>
    func GetEconomyBundles(completionHandler:@escaping(Result<GetEconomyBundlesResult,Error>) -> Void)
    {
        ApiBase.CallApi(completionHandler: { (response) in
            switch response
            {
            case .success(let result):
                completionHandler(.success(result as! GetEconomyBundlesResult ))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        })
    }
    
    /// <summary>
    /// Get Economy Container by ID
    /// </summary>
    func GetEconomyContainerByID(completionHandler:@escaping(Result<GetEconomyContainerByIDResult,Error>) -> Void)
    {
        ApiBase.CallApi(completionHandler: { (response) in
            switch response
            {
            case .success(let result):
                completionHandler(.success(result as! GetEconomyContainerByIDResult ))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        })
    }
    
    /// <summary>
    /// Get Economy Containers
    /// </summary>
    func GetEconomyContainers(completionHandler:@escaping(Result<GetEconomyContainersResult,Error>) -> Void)
    {
        ApiBase.CallApi(completionHandler: { (response) in
            switch response
            {
            case .success(let result):
                completionHandler(.success(result as! GetEconomyContainersResult ))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        })
    }
    
    /// <summary>
    /// Get Economy Items
    /// </summary>
    func GetEconomyItems(completionHandler:@escaping(Result<GetEconomyItemsResult,Error>) -> Void)
    {
        ApiBase.CallApi(completionHandler: { (response) in
            switch response
            {
            case .success(let result):
                completionHandler(.success(result as! GetEconomyItemsResult ))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        })
    }
    
    /// <summary>
    /// Get Economy Item by ID
    /// </summary>
    func GetEconomyItemsByID(completionHandler:@escaping(Result<GetEconomyItemsByIDResult,Error>) -> Void)
    {
        ApiBase.CallApi(completionHandler: { (response) in
            switch response
            {
            case .success(let result):
                completionHandler(.success(result as! GetEconomyItemsByIDResult ))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        })
    }
    
    /// <summary>
    /// Get Economy Stores
    /// </summary>
    func GetEconomyStores(completionHandler:@escaping(Result<GetEconomyStoresResult,Error>) -> Void)
    {
        ApiBase.CallApi(completionHandler: { (response) in
            switch response
            {
            case .success(let result):
                completionHandler(.success(result as! GetEconomyStoresResult ))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        })
    }
    
    /// <summary>
    /// Retrieves the set of items defined for the specified store, including all prices defined
    /// </summary>
    func getStoreItemsByID(completionHandler:@escaping(Result<GetStoreItemsByIDResult,Error>) -> Void)
    {
        ApiBase.CallApi(completionHandler: { (response) in
            switch response
            {
            case .success(let result):
                completionHandler(.success(result as! GetStoreItemsByIDResult ))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        })
    }
}

/// <summary>
/// Get Economy Bundles by ID
/// </summary>
class GetEconomyBundleByID:Base
{

    public var bundleID: String

    init(bundleID: String)
    {
        self.bundleID = bundleID
    }
    
    func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void) {
   
        EconomyAPI.getEconomyBundleByID(bundleID: bundleID)
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
/// Get Economy Bundles
/// </summary>
class GetEconomyBundles:Base
{
    public var bundleStatus:EconomyAPI.Status_getEconomyBundles

    init(bundleStatus: EconomyAPI.Status_getEconomyBundles)
    {
        self.bundleStatus = bundleStatus
    }
    
    func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void)
    {
        EconomyAPI.getEconomyBundles(status: bundleStatus)
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
/// Get Economy Container by ID
/// </summary>
class GetEconomyContainerByID:Base
{

    public var containerID: String

    init(containerID: String)
    {
        self.containerID = containerID
    }
    
    func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void) {
        EconomyAPI.getEconomyContainerByID(containerID: containerID){ (response, error) in
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
/// Get Economy Containers
/// </summary>
class GetEconomyContainers:Base
{
    public var containersStatus: EconomyAPI.Status_getEconomyContainers

    init(containersStatus: EconomyAPI.Status_getEconomyContainers)
    {
        self.containersStatus = containersStatus
    }
    
    func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void)
    {
        EconomyAPI.getEconomyContainers(status: containersStatus)
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
/// Get Economy Items
/// </summary>
class GetEconomyItems:Base
{

    public var category:String
    public var status: Int
    public var gender: Int
    
    init(category: String,status: Int,gender: Int)
    {
        self.category = category
        self.status = status
        self.gender = gender
    }
    
    func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void)
    {
        EconomyAPI.getEconomyItems(category: category, status: status, gender: gender)
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
                print(response)
                completionHandler(.success(response! as AnyObject))
            }
        }
    }
}

/// <summary>
/// Get Economy Item by ID
/// </summary>
class GetEconomyItemsByID:Base
{

    public var itemID: String

    init(itemID: String)
    {
        self.itemID = itemID
    }
    
    func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void) {
        EconomyAPI.getEconomyItemsByID(itemID: itemID){ (response, error) in
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

/// Get Economy Stores
class GetEconomyStores:Base
{
    public var storesStatus: EconomyAPI.Status_getEconomyStores

    init(storesStatus: EconomyAPI.Status_getEconomyStores)
    {
        self.storesStatus = storesStatus
    }
    func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void)
    {
        EconomyAPI.getEconomyStores(status:storesStatus)
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

/// Retrieves the set of items defined for the specified store, including all prices defined
class GetStoreItemsByID:Base
{
    public var storeID: String
    init(storeID: String)
    {
        self.storeID = storeID
    }
    
    func CallApi(completionHandler: @escaping (Result<AnyObject, Error>) -> Void) {
        EconomyAPI.getStoreItemsByID(storeID: storeID){ (response, error) in
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

