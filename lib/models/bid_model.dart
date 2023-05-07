
class Bid{
  final String amount;
  final String bidBy;
  final String taskId;
  final String bidderName;
  final String bidderRating;
  
  Bid({required this.amount, required this.bidBy, required this.taskId, required this.bidderName, required this.bidderRating});

  Map<String, dynamic> toJson() {
    return{
      'amount' : amount,
      'bidBy' : bidBy,
      'taskId' : taskId,
      'bidderName' : bidderName,
      'bidderRating': bidderRating,
    };
  }

  Bid.toJson(Map<String, dynamic> json)
  : this(
    amount: json['amount'],
    bidBy: json['bidBy'],
    taskId: json['taskId'],
    bidderName: json['bidderName'],
    bidderRating: json['bidderRating'],
  );
}