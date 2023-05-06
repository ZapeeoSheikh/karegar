
class Bid{
  final String amount;
  
  Bid({required this.amount});

  Map<String, dynamic> toJson() {
    return{
      'amount' : amount,
    };
  }

  Bid.toJson(Map<String, dynamic> json)
  : this(
    amount: json['amount'],
  );
}