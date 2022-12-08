class Money {
  String fullName = "";
  String email = "";
  int? phoneNumber = 0;
  int? amount = 0;
  String? paymentMethod = "";
  int? ccNumber = 0;

  Money(this.fullName, this.email, this.phoneNumber, 
        this.amount, this.paymentMethod, this.ccNumber);
}

class ListMoney {
  static List<Money> data = [];
}