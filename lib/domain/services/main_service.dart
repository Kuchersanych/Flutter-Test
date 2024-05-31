import 'package:scan_me/domain/entity/article.dart';
import 'package:scan_me/domain/repositories/mock_news_repository.dart';

/// Интерфейс для возамодействия с сервисом получения новостей [MockNewsService].
abstract class AbstractNewsService {
  /// Получение списка рекомендованных новостей.
  Future<List<Article>> getFeaturedNews();

  /// Получение списка последних новостей.
  Future<List<Article>> getLatestNews();
}

class MockNewsService implements AbstractNewsService {
  /// Сервис получения новостей из хранилища [Mock].
  MockNewsService({
    required this.newsRepository,
  });

  final AbstractNewsRepository newsRepository;

  @override
  Future<List<Article>> getFeaturedNews() async {
    List<Article> featuredNews = await newsRepository.getFeaturedArticles();
    return featuredNews;
  }

  @override
  Future<List<Article>> getLatestNews() async {
    List<Article> latestNews = await newsRepository.getLatestArticles();
    return latestNews;
  }
}
