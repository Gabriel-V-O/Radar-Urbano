import 'package:flutter/material.dart';

class ProtocolsScreen extends StatelessWidget {
  final List<Map<String, String>> protocols;
  final Function(int) onDelete;

  const ProtocolsScreen({
    super.key,
    required this.protocols,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    if (protocols.isEmpty) {
      return const Scaffold(
        backgroundColor: Color(0xFFF2F4F7),
        body: Center(
          child: Text(
            'Nenhum protocolo ativo.',
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF78909C),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      );
    }

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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color:
                              Color(int.parse(item['color']!)).withOpacity(0.1),
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
                      const SizedBox(height: 8),
                      IconButton(
                        constraints: const BoxConstraints(),
                        padding: EdgeInsets.zero,
                        icon: const Icon(
                          Icons.delete_outline,
                          color: Colors.redAccent,
                          size: 22,
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Excluir Protocolo'),
                                content: const Text(
                                    'Tem certeza que deseja apagar este protocolo permanentemente?'),
                                actions: [
                                  TextButton(
                                    child: const Text('CANCELAR',
                                        style: TextStyle(color: Colors.grey)),
                                    onPressed: () => Navigator.pop(context),
                                  ),
                                  TextButton(
                                    child: const Text('EXCLUIR',
                                        style: TextStyle(color: Colors.red)),
                                    onPressed: () {
                                      Navigator.pop(context);
                                      onDelete(index);
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ],
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
