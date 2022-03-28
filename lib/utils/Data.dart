class Data {
  String title;
  double rating;
  String imageUrl;
  String price;
  int Amount = 0 ;
  String documentId;
  String hotness;
  String condition;
  bool is_auction;
  bool buy_it_now;
  bool free_returns;
  Data({this.title, this.rating, this.imageUrl,this.price,this.Amount,this.documentId,this.buy_it_now,this.condition,this.free_returns,this.hotness,this.is_auction});
  int getAmount(){
    return Amount;
  }
  void setAmount(int number){
    Amount = number;
  }
}