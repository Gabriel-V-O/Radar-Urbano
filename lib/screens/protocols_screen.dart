import 'package:flutter/material.dart';

class ProtocolsScreen extends StatelessWidget {
  final List<Map<String, String>> protocols;

  const ProtocolsScreen({super.key, required this.protocols});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F4F7),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: protocols.length,
        itemBuilder: (context, index) {
          final item = protocols[index];
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
                  Expanded(
                    child: Column(
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
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
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
                  ),
                  const SizedBox(width: 8),
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
