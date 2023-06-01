import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_database/firebase_database.dart';

FirebaseDatabase database = FirebaseDatabase.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PIA_Recordatorios',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const TabBarApp(),
    );
  }
}
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(labelText: 'Username'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your username';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Aquí debes implementar la lógica de inicio de sesión
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const TabBarApp()),
                    );
                  },
                  child: Text('Iniciar Sesión'),
                ),
              ),
              TextButton(
                onPressed: () {
                  // Navega a la pantalla de registro
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterPage()),
                  );
                },
                child: Text('Registrarse'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}
class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(labelText: 'Username'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your username';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _confirmPasswordController,
                decoration: InputDecoration(labelText: 'Confirm Password'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please confirm your password';
                  }
                  if (value != _passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Navega a la pantalla de registro
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  child: Text('Registrarse'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TabBarApp extends StatelessWidget {
  const TabBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const TabBarExample(),
    );
  }
}

class TabBarExample extends StatelessWidget {
  const TabBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              color: const Color(0xFFFFFFFF),
              icon: const Icon(Icons.logout),
              onPressed: () {
                // Navega a la pantalla de registro
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
            ),
          ],
          title: const Center(
            child: Text(
              'Reminders',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFFFFFFFF),
              ),
            ),
          ),
          backgroundColor: const Color(0xFF05396E),
        ),
          bottomNavigationBar: const TabBar(
            labelColor: Color(0xFFFCAE19),
            unselectedLabelColor: Color(0xFF000000),
            tabs: <Widget>[
              Tab(
                text: 'Tareas',
                icon: Icon(Icons.task),
              ),
              Tab(
                text: 'Comida',
                icon: Icon(Icons.food_bank),
              ),
              Tab(
                text: 'Gym',
                icon: Icon(Icons.sports_gymnastics),
              ),
              Tab(
                text: 'Ocio',
                icon: Icon(Icons.bed),
              ),
            ],
          ),

        body: TabBarView(
          children: <Widget>[
            NestedTabBar(
              iconos: [Icons.work],
              tabNames: ['Tareas Pendientes'],

            ),
            NestedTabBar(
              iconos: [Icons.fastfood, Icons.fastfood_outlined],
              tabNames: ['Inventario', 'Necesario'],

            ),
            NestedTabBar(
              iconos: [Icons.arrow_forward, Icons.arrow_back, Icons.snowshoeing],
              tabNames: ['Push', 'Pull', 'Leg'],

            ),
            NestedTabBar(
              iconos: [Icons.search, Icons.check],
              tabNames: ['Intereses', 'Pendientes'],

            )
          ],
        ),
      ),
    );
  }
}

class NestedTabBar extends StatefulWidget {
  final List<IconData> iconos;
  final List<String> tabNames;

  NestedTabBar({required this.iconos, required this.tabNames});

  @override
  _NestedTabBarState createState() => _NestedTabBarState();
}

class _NestedTabBarState extends State<NestedTabBar> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: widget.tabNames.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TabBar(
          controller: _tabController,
          tabs: List<Widget>.generate(
            widget.iconos.length,
                (index) => Tab(
              icon: Icon(widget.iconos[index]),
              text: widget.tabNames[index],
            ),
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: List<Widget>.generate(
              widget.tabNames.length,
                  (index) => Card(
                margin: const EdgeInsets.all(16.0),
                child: ListaWidget(icono: widget.iconos[index]),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ListaWidget extends StatefulWidget {
  final IconData icono;

  ListaWidget({required this.icono});

  @override
  _ListaWidgetState createState() => _ListaWidgetState();
}

class _ListaWidgetState extends State<ListaWidget> {
  List<String> elementos = [];

  void agregarElemento(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String nuevoElemento = '';

        return AlertDialog(
          title: Text('Agregar elemento'),
          content: TextField(
            onChanged: (value) {
              nuevoElemento = value;
            },
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  elementos.add(nuevoElemento);
                });
                Navigator.of(context).pop();
              },
              child: Text('Agregar a recordatorios'),
            ),
          ],
        );
      },
    );
  }

  void eliminarElemento(int index) {
    setState(() {
      elementos.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Icon(widget.icono), // Utilizar el icono pasado como parámetro
              const Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Agregar a la lista',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Color(0xFF27272A),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.topRight,
                  child: ElevatedButton(
                    onPressed: () => agregarElemento(context), // Pasar el contexto al método agregarElemento
                    child: Icon(Icons.add),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: elementos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  selected: true,
                  title: Text(
                    elementos[index],
                  style: const TextStyle(fontSize: 20),
                  ),
                  subtitle: const TextField(
                    decoration: InputDecoration(
                      hintText: 'Descripcion',
                    ),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () {
                      eliminarElemento(index);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
