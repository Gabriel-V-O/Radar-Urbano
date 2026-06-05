import 'package:flutter/material.dart';

class ProtocolsScreen extends StatelessWidget {
  const ProtocolsScreen({super.key});

  final List<Map<String, String>> _protocols = const [
    {
      'id': '#2026-0041',
      'category': 'Buraco na Via',
      'date': '05/06/2026',
      'status': 'Em Análise',
      'color': '0xFFFF9100'
    },
    {
      'id': '#2026-0018',
      'category': 'Lâmpada Queimada',
      'date': '28/05/2026',
      'status': 'Resolvido',
      'color': '0xFF00C853'
    },
    {
      'id': '#2026-0005',
      'category': 'Vazamento de Água',
      'date': '15/05/2026',
      'status': 'Encaminhado',
      'color': '0xFF2979FF'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F4F7),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _protocols.length,
        itemBuilder: (context, index) {
          final item = _protocols[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: const BorderSide(color: Color(0xFFCFD8DC)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['id']!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF546E7A),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item['category']!,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF212121),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Aberto em: ${item['date']}',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF78909C),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Color(int.parse(item['color']!))
                          .withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Color(int.parse(item['color']!)),
                      ),
                    ),
                    child: Text(
                      item['status']!,
                      style: TextStyle(
                        color: Color(int.parse(item['color']!)),
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
