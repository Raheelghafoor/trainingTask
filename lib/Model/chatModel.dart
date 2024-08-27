/// id : 69
/// email : "rahman23@gmail.com"
/// name : "rahman"
/// contact : 3244444656
/// is_active : true
/// is_admin : false
/// created_at : "2024-08-21T11:51:30.310963Z"
/// updated_at : "2024-08-21T12:31:18.617798Z"
/// image : null
/// is_registered : false
/// is_deleted : false

class ChatModel {
  ChatModel({
      num? id, 
      String? email, 
      String? name, 
      num? contact, 
      bool? isActive, 
      bool? isAdmin, 
      String? createdAt, 
      String? updatedAt, 
      dynamic image, 
      bool? isRegistered, 
      bool? isDeleted,}){
    _id = id;
    _email = email;
    _name = name;
    _contact = contact;
    _isActive = isActive;
    _isAdmin = isAdmin;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _image = image;
    _isRegistered = isRegistered;
    _isDeleted = isDeleted;
}

  ChatModel.fromJson(dynamic json) {
    _id = json['id'];
    _email = json['email'];
    _name = json['name'];
    _contact = json['contact'];
    _isActive = json['is_active'];
    _isAdmin = json['is_admin'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _image = json['image'];
    _isRegistered = json['is_registered'];
    _isDeleted = json['is_deleted'];
  }
  num? _id;
  String? _email;
  String? _name;
  num? _contact;
  bool? _isActive;
  bool? _isAdmin;
  String? _createdAt;
  String? _updatedAt;
  dynamic _image;
  bool? _isRegistered;
  bool? _isDeleted;
ChatModel copyWith({  num? id,
  String? email,
  String? name,
  num? contact,
  bool? isActive,
  bool? isAdmin,
  String? createdAt,
  String? updatedAt,
  dynamic image,
  bool? isRegistered,
  bool? isDeleted,
}) => ChatModel(  id: id ?? _id,
  email: email ?? _email,
  name: name ?? _name,
  contact: contact ?? _contact,
  isActive: isActive ?? _isActive,
  isAdmin: isAdmin ?? _isAdmin,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  image: image ?? _image,
  isRegistered: isRegistered ?? _isRegistered,
  isDeleted: isDeleted ?? _isDeleted,
);
  num? get id => _id;
  String? get email => _email;
  String? get name => _name;
  num? get contact => _contact;
  bool? get isActive => _isActive;
  bool? get isAdmin => _isAdmin;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  dynamic get image => _image;
  bool? get isRegistered => _isRegistered;
  bool? get isDeleted => _isDeleted;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['email'] = _email;
    map['name'] = _name;
    map['contact'] = _contact;
    map['is_active'] = _isActive;
    map['is_admin'] = _isAdmin;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['image'] = _image;
    map['is_registered'] = _isRegistered;
    map['is_deleted'] = _isDeleted;
    return map;
  }

}