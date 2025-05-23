// pages/home_page.dart
import 'package:docflow/models/notice.dart';
import 'package:docflow/services/notice_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:docflow/components/notice_card.dart';
import 'package:docflow/components/search_box.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final NoticeService noticeService = NoticeService();

    return FutureBuilder<List<Notice>>(
      future: noticeService.find(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError || !snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('Nenhum edital encontrado.'));
        }

        final notices = snapshot.data!;
        final recentNotices = notices.take(3).toList();
        final popularNotices = List<Notice>.from(notices)
          ..sort((a, b) => b.views.compareTo(a.views));
        final topPopular = popularNotices.take(3).toList();

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 24,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Image.asset(
                          'assets/images/logo.png',
                          height: 30,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SearchBox(onSearch: (_) {}),
                ),
                const SizedBox(height: 32),

                // Recentes
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Icon(
                            Feather.clock,
                            size: 18,
                            color: Color(0xFF1E3A8A),
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Recente',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Column(
                        children:
                            recentNotices.map((notice) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 12),
                                child: NoticeCard(
                                  notice: notice,
                                  onTap:
                                      () => Navigator.pushNamed(
                                        context,
                                        '/chat',
                                        arguments: notice.id,
                                      ),
                                ),
                              );
                            }).toList(),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // Populares
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Icon(
                            Feather.trending_up,
                            size: 18,
                            color: Color(0xFF1E3A8A),
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Popular',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Column(
                        children:
                            topPopular.map((notice) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 12),
                                child: NoticeCard(
                                  notice: notice,
                                  onTap:
                                      () => Navigator.pushNamed(
                                        context,
                                        '/chat',
                                        arguments: notice.id,
                                      ),
                                ),
                              );
                            }).toList(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
