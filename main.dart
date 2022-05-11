import 'dart:io';

class Book {
  String Title = "";
  String Author = "";
  String Genre = "";
  int ID_Borrower = 0;
  bool available = true;

  List genre = [
    "Computer Science",
    "Philosophy",
    "Pure Science",
    "Art and Recreation",
    "History"
  ];

  addBook() {
    stdout.write("Title : ");
    Title = stdin.readLineSync()!;
    stdout.write("Author :");
    Author = stdin.readLineSync()!;
    do {
      stdout.write("Genre: ");
      Genre = stdin.readLineSync()!;
    } while (!genre.contains(Genre));
  }

  display() {
    stdout.write(Title + " - " + Author + " - " + Genre);
    if (available == true) {
      print(" Status : Available");
    } else {
      print(" Status : Borrowed");
    }
  }
}

class Customer {
  String Name = " ";
  String Address = " ";
  List BorrowedBooks = [];

  addCutomer() {
    stdout.write("Name : ");
    Name = stdin.readLineSync()!;
    stdout.write("Address :");
    Address = stdin.readLineSync()!;
  }

  display() {
    stdout.write("Name: " + Name + " Address: " + Address + " Books : ");
    BorrowedBooks.forEach((e) {
      stdout.write(BookDetails[e].Title + ", ");
    });
    print(" ");
  }
}

displayOptions() {
  print("1: Add Book ");
  print("2. Display all Available Books");
  print("3. Display Borrowed Books");
  print("4. Display Available Books");
  print("5. Add new Customer");
  print("6. Display All Customers");
  print("7. Borrow Book/s");
  
  print("Genres Available: ");
  print('"Computer Science",\t"Philosophy"');
  print('"Pure Science",\t"History"');
  print('"Art and Recreation"');
}

var BookDetails = new Map(); 
List ISBN = []; 
int bookCount = 0;

var CustomerDetails = new Map(); 
List USERNAME =
    []; 
int customerCount = 0; 

main() {
  displayOptions();
  var choice = " ";
  do {
    stdout.write("Enter Choice: ");
    choice = stdin.readLineSync()!;
    switch (choice) {
      case '1':
        {
          var temp = " ";
          stdout.write("Enter ISBN : ");
          temp = stdin.readLineSync()!;
          if (ISBN.contains(temp)) {
            print("That ISBN already Exist");
          } else {
            ISBN.add(temp);
            Book b = new Book();
            b.addBook();
            BookDetails[temp] = b;
            bookCount++;
            stdout.write(b.Title);
            print(" Added");
          }
        }
        break;

      case '2':
        {
          print("All Books: ");
          for (int a = 0; a < bookCount; a++) {
            stdout.write(ISBN[a] + " - ");
            BookDetails[ISBN[a]].display();
          }
        }
        break;

      case '3':
        {
          print("Borrowed Books: ");
          for (int a = 0; a < bookCount; a++) {
            if (BookDetails[ISBN[a]].available == false) {
              BookDetails[ISBN[a]].display();
            }
          }
        }
        break;

      case '4': 
        {
          print("Available Books");
          for (int a = 0; a < bookCount; a++) {
            if (BookDetails[ISBN[a]].available == true) {
              BookDetails[ISBN[a]].display();
            }
          }
        }
        break;

      case '5': 
        {
          var temp = " ";
          stdout.write("Enter Username : ");
          temp = stdin.readLineSync()!;
          if (USERNAME.contains(temp)) {
            print("That Username already Exist");
          } else {
            USERNAME.add(temp);
            Customer c = new Customer();
            c.addCutomer();
            CustomerDetails[temp] = c;
            customerCount++;
            print("$temp Added");
          }
        }
        break;

      case '6': 
        {
          for (int a = 0; a < customerCount; a++) {
            CustomerDetails[USERNAME[a]].display();
          }
        }
        break;

      case '7': 
        {
          var tempUname = " ";
          stdout.write("Enter Username : ");
          tempUname = stdin.readLineSync()!;
          if (!USERNAME.contains(tempUname)) {
            print("Username doesn't Exist, add customer or review username");
            continue;
          }
          var tempISBN = " ";
          stdout.write("Enter ISBN : ");
          tempISBN = stdin.readLineSync()!;
          if (!ISBN.contains(tempISBN)) {
            print("Book doesn't Exist, add book or review ISBN");
            continue;
          }

          BookDetails[tempISBN].available = false;
          CustomerDetails[tempUname].BorrowedBooks.add(tempISBN);
        }
        break;

      default:
        break;
    }
  } while (choice != '9');
}