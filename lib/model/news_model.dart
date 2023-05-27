class Newsmodel {
  String? status;
  int? totalResults;
  List<Articles>? articles = [];

  Newsmodel({this.status, this.totalResults, this.articles});

  factory Newsmodel.fromjson(Map m)
  {
    List articlelist=m['articles'];
    return Newsmodel(status: m['status'],totalResults: m['totalResults'],articles: articlelist.map((e) => Articles.fromjson(e)).toList());
  }
}

class Articles {
  Source? source;
  String? author, title, description, url, urltoImage, publishedAt, content;

  Articles({this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urltoImage,
    this.publishedAt,
    this.content});

  factory Articles.fromjson(Map m)
  {
    
    return Articles(title: m['title'],
        description: m['description'],
        url: m['url'],
        author: m['author'],
        content: m['content'],
        publishedAt: m['publishedAt'],
        urltoImage: m['urltoImage'],
        source: Source.fromjson(m['source']));
  }
}

class Source {
  String? name,id;

  Source({this.id, this.name});

  factory Source.fromjson(Map m1)
  {
    return Source(id: m1['id'], name: m1['name']);
  }
}