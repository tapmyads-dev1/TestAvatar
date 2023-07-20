import Foundation

struct ThreeDArtifact : Codable , Hashable
{
    /// Gets or Sets device
    let device: Int?
    
    /// Gets or Sets format
    let format: Int?
    
    /// Gets or Sets lod
    let lod: Int?
    
    /// Gets or Sets mesh_url
    let mesh_url: String?
    
    /// Gets or Sets normals
    let normals: Int?
    
    /// Gets or Sets rig
    let rig: Int?
    
    /// Gets or Sets selected
    let selected: Bool?
    
    /// Gets or Sets texture_size
    let texture_size: Int?
    
    public init( device: Int? = nil,format: Int? = nil, lod: Int? = nil, mesh_url: String? = nil, normals: Int? = nil, rig: Int? = nil,selected: Bool? = nil, texture_size: Int? = nil) {
        self.device = device
        self.format = format
        self.lod = lod
        self.mesh_url = mesh_url
        self.normals = normals
        self.rig = rig
        self.selected = selected
        self.texture_size = texture_size
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case device = "device"
        case format = "format"
        case lod = "lod"
        case mesh_url = "mesh_url"
        case normals = "normals"
        case rig = "rig"
        case selected = "selected"
        case texture_size = "texture_size"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(device, forKey: .device)
        try container.encodeIfPresent(format, forKey: .format)
        try container.encodeIfPresent(lod, forKey: .lod)
        try container.encodeIfPresent(mesh_url, forKey: .mesh_url)
        try container.encodeIfPresent(normals, forKey: .normals)
        try container.encodeIfPresent(rig, forKey: .rig)
        try container.encodeIfPresent(selected, forKey: .selected)
        try container.encodeIfPresent(texture_size, forKey: .texture_size)
    }
}
