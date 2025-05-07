import 'package:flutter/material.dart';
import 'package:docflow/models/notice.dart';

class NoticeProvider extends InheritedWidget {
  final List<Notice> notices;
  final Widget child;

  NoticeProvider({required this.child, Key? key})
    : notices = mockNotices,
      super(key: key, child: child);

  Notice? getNoticeById(String id) {
    return notices.firstWhere((notice) => notice.id == id);
  }

  @override
  bool updateShouldNotify(NoticeProvider oldWidget) => false;

  static NoticeProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<NoticeProvider>()!;
  }
}

List<Notice> mockNotices = [
  Notice(
    id: '1',
    title: 'Edital para Seleção de Bolsistas de Iniciação Científica',
    description:
        'Processo seletivo para bolsas de iniciação científica no IFBA com duração de 12 meses. Áreas: Engenharias, Computação e Ciências Exatas.',
    publishedAt: DateTime(2025, 3, 10, 14, 0, 0),
    expiresAt: DateTime(2025, 4, 30, 23, 59, 59),
    status: 'Aberto',
    organization: 'IFBA - Instituto Federal da Bahia',
    category: 'Edital Acadêmico',
    views: 845,
    tags: ['PIBIC', 'Bolsas', 'Pesquisa'],
  ),
  Notice(
    id: '2',
    title: 'Edital de Extensão para Projetos Comunitários',
    description:
        'Chamada pública para submissão de projetos de extensão universitária com foco em comunidades carentes da região sudoeste da Bahia.',
    publishedAt: DateTime(2025, 2, 15, 9, 30, 0),
    expiresAt: DateTime(2025, 5, 15, 17, 0, 0),
    status: 'Aberto',
    organization: 'UESB - Universidade Estadual do Sudoeste da Bahia',
    category: 'Edital de Extensão',
    views: 723,
    tags: ['Extensão', 'Comunidade', 'Projetos Sociais'],
  ),
  Notice(
    id: '3',
    title: 'Processo Seletivo para Mestrado Acadêmico',
    description:
        'Edital de seleção para o programa de mestrado em Educação Científica e Formação de Professores do IFBA. Inscrições até 15/05/2025.',
    publishedAt: DateTime(2025, 3, 1, 10, 15, 0),
    expiresAt: DateTime(2025, 5, 15, 16, 45, 0),
    status: 'Aberto',
    organization: 'IFBA - Instituto Federal da Bahia',
    category: 'Edital de Pós-Graduação',
    views: 932,
    tags: ['Mestrado', 'Seleção', 'Pós-graduação'],
  ),
  Notice(
    id: '4',
    title: 'Edital de Monitoria para Disciplinas de Graduação',
    description:
        'Seleção de monitores para disciplinas dos cursos de graduação em Ciência da Computação e Engenharia Elétrica.',
    publishedAt: DateTime(2025, 2, 20, 8, 0, 0),
    expiresAt: DateTime(2025, 3, 20, 23, 59, 59),
    status: 'Fechado',
    organization: 'UESB - Universidade Estadual do Sudoeste da Bahia',
    category: 'Edital Acadêmico',
    views: 456,
    tags: ['Monitoria', 'Graduação', 'Seleção'],
  ),
  Notice(
    id: '5',
    title: 'Chamada para Submissão de Artigos - Seminário de Pesquisa',
    description:
        'Edital para submissão de trabalhos científicos no XXV Seminário de Pesquisa em Educação e Tecnologias do IFBA.',
    publishedAt: DateTime(2025, 3, 5, 13, 0, 0),
    expiresAt: DateTime(2025, 4, 25, 17, 0, 0),
    status: 'Aberto',
    organization: 'IFBA - Instituto Federal da Bahia',
    category: 'Edital Científico',
    views: 587,
    tags: ['Evento', 'Publicação', 'Pesquisa'],
  ),
  Notice(
    id: '6',
    title: 'Edital de Apoio a Participação em Eventos Científicos',
    description:
        'Programa de auxílio financeiro para discentes e docentes participarem de congressos e seminários nacionais e internacionais.',
    publishedAt: DateTime(2025, 1, 15, 11, 20, 0),
    expiresAt: DateTime(2025, 12, 15, 15, 0, 0),
    status: 'Aberto',
    organization: 'UESB - Universidade Estadual do Sudoeste da Bahia',
    category: 'Edital de Apoio',
    views: 1024,
    tags: ['Auxílio', 'Eventos', 'Viagem Acadêmica'],
  ),
];
