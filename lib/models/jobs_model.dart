
class Job{
  final String title;
  final String description;
  final String videoUrl;
  final String budget;
  final String time;
  final String date;
  final List<double> location;
  final String address;
  final String postedBy;
  final int numberOfBids;
  final String jobType;
  final String jobStatus; 
  final String name;
  final String imageUrl;
  String jobId;
  Job({
    required this.title,
    required this.description,
    required this.videoUrl,
    required this.budget,
    required this.time,
    required this.date,
    required this.location,
    required this.address,
    required this.postedBy,
    required this.numberOfBids,
    required this.jobType,
    required this.jobId,
    required this.jobStatus,
    required this. name,
    required this.imageUrl,
  });

  Map<String, dynamic> toJson() {
    return {
      'title' : title,
      'description' : description,
      'videoUrl' : videoUrl,
      'budget' : budget,
      'time' : time,
      'date' : date,
      'location' : location,
      'address' : address,
      'postedBy' : postedBy,
      'numberOfBids' : numberOfBids,
      'jobType' : jobType,
      'jobId' : jobId,
      'jobStatus' : jobStatus,
      'name' : name,
      'imageUrl' : imageUrl,
    };
  }

  Job.fromJson(Map<String, dynamic> json)
  : this(
    title: json['title'],
    description: json['description'],
    videoUrl: json['videoUrl'],
    budget: json['budget'],
    time: json['time'],
    date: json['date'],
    location: json['location'],
    address: json['address'],
    postedBy: json['postedBy'],
    numberOfBids: json['numberOfBids'],
    jobType: json['jobType'],
    jobId: json['jobId'],
    jobStatus: json['jobStatus'],
    name: json['name'],
    imageUrl: json['imageUrl'],
  );

}