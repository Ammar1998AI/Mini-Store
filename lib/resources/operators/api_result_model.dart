import 'dart:convert';

Structure welcomeFromJson(String str) => Structure.fromJson(json.decode(str));

String welcomeToJson(Structure data) => json.encode(data.toJson());

class Structure {
  Structure({
    this.requestInfo,
    this.requestMetadata,
    this.requestParameters,
    this.searchResults,
    this.pagination,
  });

  RequestInfo requestInfo;
  RequestMetadata requestMetadata;
  RequestParameters requestParameters;
  List<SearchResult> searchResults;
  Pagination pagination;

  factory Structure.fromJson(Map<String, dynamic> json) => Structure(
    requestInfo: RequestInfo.fromJson(json["request_info"]),
    requestMetadata: RequestMetadata.fromJson(json["request_metadata"]),
    requestParameters: RequestParameters.fromJson(json["request_parameters"]),
    searchResults: List<SearchResult>.from(json["search_results"].map((x) => SearchResult.fromJson(x))),
    pagination: Pagination.fromJson(json["pagination"]),
  );

  Map<String, dynamic> toJson() => {
    "request_info": requestInfo.toJson(),
    "request_metadata": requestMetadata.toJson(),
    "request_parameters": requestParameters.toJson(),
    "search_results": List<dynamic>.from(searchResults.map((x) => x.toJson())),
    "pagination": pagination.toJson(),
  };
}

class Pagination {
  Pagination({
    this.hasNextPage,
    this.nextPage,
    this.currentPage,
    this.totalResults,
  });

  bool hasNextPage;
  int nextPage;
  int currentPage;
  int totalResults;

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
    hasNextPage: json["has_next_page"],
    nextPage: json["next_page"],
    currentPage: json["current_page"],
    totalResults: json["total_results"],
  );

  Map<String, dynamic> toJson() => {
    "has_next_page": hasNextPage,
    "next_page": nextPage,
    "current_page": currentPage,
    "total_results": totalResults,
  };
}

class RequestInfo {
  RequestInfo({
    this.success,
    this.creditsUsed,
    this.creditsRemaining,
    this.creditsUsedThisRequest,
  });

  bool success;
  int creditsUsed;
  int creditsRemaining;
  int creditsUsedThisRequest;

  factory RequestInfo.fromJson(Map<String, dynamic> json) => RequestInfo(
    success: json["success"],
    creditsUsed: json["credits_used"],
    creditsRemaining: json["credits_remaining"],
    creditsUsedThisRequest: json["credits_used_this_request"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "credits_used": creditsUsed,
    "credits_remaining": creditsRemaining,
    "credits_used_this_request": creditsUsedThisRequest,
  };
}

class RequestMetadata {
  RequestMetadata({
    this.createdAt,
    this.processedAt,
    this.totalTimeTaken,
    this.ebayUrl,
  });

  DateTime createdAt;
  DateTime processedAt;
  double totalTimeTaken;
  String ebayUrl;

  factory RequestMetadata.fromJson(Map<String, dynamic> json) => RequestMetadata(
    createdAt: DateTime.parse(json["created_at"]),
    processedAt: DateTime.parse(json["processed_at"]),
    totalTimeTaken: json["total_time_taken"].toDouble(),
    ebayUrl: json["ebay_url"],
  );

  Map<String, dynamic> toJson() => {
    "created_at": createdAt.toIso8601String(),
    "processed_at": processedAt.toIso8601String(),
    "total_time_taken": totalTimeTaken,
    "ebay_url": ebayUrl,
  };
}

class RequestParameters {
  RequestParameters({
    this.type,
    this.ebayDomain,
    this.searchTerm,
  });

  String type;
  String ebayDomain;
  String searchTerm;

  factory RequestParameters.fromJson(Map<String, dynamic> json) => RequestParameters(
    type: json["type"],
    ebayDomain: json["ebay_domain"],
    searchTerm: json["search_term"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "ebay_domain": ebayDomain,
    "search_term": searchTerm,
  };
}

class SearchResult {
  SearchResult({
    this.position,
    this.title,
    this.epid,
    this.link,
    this.image,
    this.hotness,
    this.condition,
    this.isAuction,
    this.buyItNow,
    this.freeReturns,
    this.prices,
    this.price,
    this.bidCount,
    this.auctionTime,
    this.itemLocation,
    this.shippingCost,
  });

  int position;
  String title;
  String epid;
  String link;
  String image;
  String hotness;
  Condition condition;
  bool isAuction;
  bool buyItNow;
  bool freeReturns;
  List<Price> prices;
  Price price;
  int bidCount;
  AuctionTime auctionTime;
  String itemLocation;
  double shippingCost;

  factory SearchResult.fromJson(Map<String, dynamic> json) => SearchResult(
    position: json["position"],
    title: json["title"],
    epid: json["epid"],
    link: json["link"],
    image: json["image"],
    hotness: json["hotness"] == null ? null : json["hotness"],
    condition: conditionValues.map[json["condition"]],
    isAuction: json["is_auction"],
    buyItNow: json["buy_it_now"],
    freeReturns: json["free_returns"],
    prices: json["prices"] == null ? null : List<Price>.from(json["prices"].map((x) => Price.fromJson(x))),
    price: json["price"] == null ? null : Price.fromJson(json["price"]),
    bidCount: json["bid_count"] == null ? null : json["bid_count"],
    auctionTime: json["auction_time"] == null ? null : AuctionTime.fromJson(json["auction_time"]),
    itemLocation: json["item_location"] == null ? null : json["item_location"],
    shippingCost: json["shipping_cost"] == null ? null : json["shipping_cost"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "position": position,
    "title": title,
    "epid": epid,
    "link": link,
    "image": image,
    "hotness": hotness == null ? null : hotness,
    "condition": conditionValues.reverse[condition],
    "is_auction": isAuction,
    "buy_it_now": buyItNow,
    "free_returns": freeReturns,
    "prices": prices == null ? null : List<dynamic>.from(prices.map((x) => x.toJson())),
    "price": price == null ? null : price.toJson(),
    "bid_count": bidCount == null ? null : bidCount,
    "auction_time": auctionTime == null ? null : auctionTime.toJson(),
    "item_location": itemLocation == null ? null : itemLocation,
    "shipping_cost": shippingCost == null ? null : shippingCost,
  };
}

class AuctionTime {
  AuctionTime({
    this.raw,
    this.utc,
  });

  String raw;
  DateTime utc;

  factory AuctionTime.fromJson(Map<String, dynamic> json) => AuctionTime(
    raw: json["raw"],
    utc: DateTime.parse(json["utc"]),
  );

  Map<String, dynamic> toJson() => {
    "raw": raw,
    "utc": utc.toIso8601String(),
  };
}

enum Condition { BRAND_NEW, NEW_OTHER, REFURBISHED, PRE_OWNED }

final conditionValues = EnumValues({
  "Brand New": Condition.BRAND_NEW,
  "New (Other)": Condition.NEW_OTHER,
  "Pre-Owned": Condition.PRE_OWNED,
  "Refurbished": Condition.REFURBISHED
});

class Price {
  Price({
    this.value,
    this.raw,
  });

  double value;
  String raw;

  factory Price.fromJson(Map<String, dynamic> json) => Price(
    value: json["value"].toDouble(),
    raw: json["raw"],
  );

  Map<String, dynamic> toJson() => {
    "value": value,
    "raw": raw,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
