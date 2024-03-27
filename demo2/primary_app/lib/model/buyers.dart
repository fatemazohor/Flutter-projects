

class Buyers {
  int? id;
  String? organization;
  String? contactPerson;
  String? phone;
  String? email;
  String? address;
  String? country;

  Buyers(
      {this.id,
        this.organization,
        this.contactPerson,
        this.phone,
        this.email,
        this.address,
        this.country});

  Buyers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    organization = json['organization'];
    contactPerson = json['contactPerson'];
    phone = json['phone'];
    email = json['email'];
    address = json['address'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['organization'] = this.organization;
    data['contactPerson'] = this.contactPerson;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['address'] = this.address;
    data['country'] = this.country;
    return data;
  }
}