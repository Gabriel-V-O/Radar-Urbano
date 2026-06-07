import 'package:flutter/material.dart';
import '../widgets/category_card.dart';
import 'map_screen.dart';
import 'protocols_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedCategory = 'Buraco';
  int _currentBottomNavIndex = 0;
  final TextEditingController _addressController = TextEditingController();

  final List<Map<String, String>> _protocols = [
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

  final List<Map<String, dynamic>> _categories = [
    {'title': 'Buraco', 'icon': Icons.circle, 'color': Colors.deepPurple[900]},
    {'title': 'Iluminação', 'icon': Icons.lightbulb, 'color': Colors.amber},
    {'title': 'Lixo', 'icon': Icons.delete, 'color': Colors.grey},
    {'title': 'Árvore', 'icon': Icons.forest, 'color': Colors.green},
    {'title': 'Vazamento', 'icon': Icons.opacity, 'color': Colors.blue},
    {'title': 'Outros', 'icon': Icons.add, 'color': Colors.purple},
  ];

  void _handleSubmitReport() {
    final String typedAddress = _addressController.text.trim();

    if (typedAddress.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
              'Por favor, informe a localização do problema antes de reportar.'),
          backgroundColor: Colors.redAccent,
          duration: Duration(seconds: 3),
        ),
      );
      return;
    }

    final String displayCategory = '$_selectedCategory em $typedAddress';

    setState(() {
      _protocols.insert(0, {
        'id': '#2026-00${_protocols.length + 1}',
        'category': displayCategory,
        'date': '06/06/2026',
        'status': 'Em Análise',
        'color': '0xFFFF9100'
      });
      _addressController.clear();
      _currentBottomNavIndex = 2;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Problema reportado com sucesso!'),
        backgroundColor: Color(0xFF00C853),
      ),
    );
  }

  Widget _buildReportForm() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'O que deseja reportar?',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF212121),
            ),
          ),
          const SizedBox(height: 12),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.1,
            ),
            itemCount: _categories.length,
            itemBuilder: (context, index) {
              final cat = _categories[index];
              final isSelected = _selectedCategory == cat['title'];
              return CategoryCard(
                title: cat['title'],
                icon: cat['icon'],
                iconColor: cat['color'],
                isSelected: isSelected,
                onTap: () {
                  setState(() {
                    _selectedCategory = cat['title'];
                  });
                },
              );
            },
          ),
          const SizedBox(height: 24),

          // ALTERAÇÃO AQUI: Adicionado o texto (opcional) estilizado com uma cor mais suave
          RichText(
            text: const TextSpan(
              text: 'Evidência Visual ',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF212121),
                fontFamily: 'Segoe UI',
              ),
              children: [
                TextSpan(
                  text: '(opcional)',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Color(0xFF78909C),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),
          Container(
            width: double.infinity,
            height: 120,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: const Color(0xFFB0BEC5),
                width: 1,
              ),
            ),
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.transparent),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.camera_alt,
                    color: Color(0xFF78909C),
                    size: 32,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Tirar Foto ou Subir Arquivo',
                    style: TextStyle(
                      color: Color(0xFF546E7A),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Localização do Problema',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF212121),
            ),
          ),
          const SizedBox(height: 12),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: TextField(
              controller: _addressController,
              decoration: const InputDecoration(
                hintText: 'Digite o endereço ou nome do local...',
                hintStyle: TextStyle(color: Color(0xFF78909C), fontSize: 14),
                prefixIcon: Icon(Icons.search, color: Color(0xFF78909C)),
                border: InputBorder.none,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 14, horizontal: 16),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Container(
            width: double.infinity,
            height: 180,
            decoration: BoxDecoration(
              color: const Color(0xFFE0E0E0),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFCFD8DC)),
            ),
            child: Stack(
              children: [
                CustomPaint(
                  size: const Size(double.infinity, 180),
                  painter: MapMockPainter(),
                ),
                const Center(
                  child: Icon(
                    Icons.location_on,
                    color: Color(0xFFE91E63),
                    size: 36,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: _handleSubmitReport,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFE65100),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 2,
              ),
              child: const Text(
                'REPORTAR PROBLEMA',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      _buildReportForm(),
      const MapScreen(),
      ProtocolsScreen(protocols: _protocols),
    ];

    final List<String> titles = [
      'Radar Urbano',
      'Mapa de Ocorrências',
      'Meus Protocolos',
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2C1B4D),
        elevation: 0,
        title: Text(
          titles[_currentBottomNavIndex],
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16, top: 12, bottom: 12),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: const Color(0xFF00C853),
              borderRadius: BorderRadius.circular(4),
            ),
            alignment: Alignment.center,
            child: const Text(
              'ANÔNIMO',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
      body: screens[_currentBottomNavIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentBottomNavIndex,
        onTap: (index) {
          setState(() {
            _currentBottomNavIndex = index;
          });
        },
        selectedItemColor: const Color(0xFFE65100),
        unselectedItemColor: const Color(0xFF78909C),
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.campaign),
            label: 'Reportar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Mapa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Protocolos',
          ),
        ],
      ),
    );
  }
}

class MapMockPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paintLine = Paint()
      ..color = const Color(0xFFB0BEC5)
      ..strokeWidth = 2;

    final paintCircle = Paint()
      ..color = const Color(0xFFFFF9C4)
      ..style = PaintingStyle.fill;

    canvas.drawLine(Offset(0, size.height / 2),
        Offset(size.width, size.height / 2), paintLine);
    canvas.drawLine(Offset(size.width * 0.25, 0),
        Offset(size.width * 0.25, size.height), paintLine);
    canvas.drawLine(Offset(size.width * 0.5, 0),
        Offset(size.width * 0.5, size.height), paintLine);
    canvas.drawLine(Offset(size.width * 0.75, 0),
        Offset(size.width * 0.75, size.height), paintLine);

    canvas.drawCircle(
        Offset(size.width * 0.25, size.height / 2), 6, paintCircle);
    canvas.drawCircle(
        Offset(size.width * 0.5, size.height / 2), 6, paintCircle);
    canvas.drawCircle(
        Offset(size.width * 0.75, size.height / 2), 6, paintCircle);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
