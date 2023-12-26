# MyFin
Myfin app repository


HomePage(
        onTabChange: (index) {
           //Здесь вы можете обработать изменение индекса
          if (kDebugMode) {
            print('Tab changed to index $index');
         }
        },
        screens: const [
          HomeScreen(),
          NewScreen(),
          ExpensesScreen(),
          IncomesScreen(),
        ],
      ),