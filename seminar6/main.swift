protocol FoodProtocol{
    var price: Double { get set }
}

struct Pizza: FoodProtocol {
    enum PizzaType{
        case pepperoni
        case cheese
        case veggie
        case bbqChicken
        case meatLovers
        case margherita
        case buffalo
        case hawaiian
        case supreme
        case theWorks
        case newYorkStyle
        case chicagoDeepDish
        case greekStyle
    }
    enum Additives{
        case cheeseMozzarella
        case cheeseProvolone
        case cheeseCheddar
        case cheeseParmesan
        case cheeseGouda
        case tomatoes
        case pepperoni
        case salmon
    }
    var price: Double
    var type: PizzaType
    var isThickDough: Bool
    var additives: [Additives]
}

struct FrenchFries: FoodProtocol{
    enum Size{
        case s
        case m
        case l
    }
    var price: Double
    var size: Size
}

class Pizzeria{
    private var foods: [FoodProtocol]
    private var workers: [WorkerStruct]
// Добавить в класс пиццерии свойство, в котором хранится массив столиков
    private var tables: [Table] = []
    
    init(foods: [FoodProtocol], workers: [WorkerStruct]){
        self.foods = foods
        self.workers = workers
//      Столики создаются сразу в инициализаторе, не передаются туда в качестве параметра
        tables = [Table(seats: 4, pizzeria: self),
                  Table(seats: 4, pizzeria: self),
                  Table(seats: 4, pizzeria: self)]
    }

    func addFood(food: FoodProtocol){
        self.foods.append(food)
    }
    func addWorker(worker: WorkerStruct){
        self.workers.append(worker)
    }
    
    func getAllFood()-> [FoodProtocol]{
        foods
    }
}

protocol OpenClose{
    func open()
    func close()
}

extension Pizzeria: OpenClose {

    func open(){
        print("Открыто.")
    }
    func close(){
        print("Закрыто!")
    }
}

var myPizzeria = Pizzeria(foods: [], workers: [])

let pizzaHawaiian = Pizza(price: 399.99, type: .hawaiian, isThickDough: true, additives: [.pepperoni, .cheeseCheddar])
let pizzaPepperoni = Pizza(price: 500, type: .hawaiian, isThickDough: false, additives: [.cheeseGouda])
let pizzaCheese = Pizza(price: 250.50, type: .cheese, isThickDough: true, additives: [.tomatoes])
let pizzaChicagoDeepDish = Pizza(price: 400, type: .chicagoDeepDish, isThickDough: false, additives: [.salmon, .tomatoes])

let frenchFriesL = FrenchFries(price: 150, size: .l)
let frenchFriesM = FrenchFries(price: 110.5, size: .m)
let frenchFriesS = FrenchFries(price: 90.9, size: .s)

myPizzeria.addFood(food: pizzaHawaiian)
myPizzeria.addFood(food: pizzaPepperoni)
myPizzeria.addFood(food: pizzaCheese)
myPizzeria.addFood(food: pizzaChicagoDeepDish)
myPizzeria.addFood(food: frenchFriesS)
myPizzeria.addFood(food: frenchFriesM)
myPizzeria.addFood(food: frenchFriesL)

/*
    1. Создать структуру работника пиццерии. В ней должны быть такие свойства,
    как имя, зарплата и должность. Должностей пока может быть две:
    или кассир, или повар.
    Добавить в класс пиццерии массив с работниками
*/
struct WorkerStruct{
    enum WorkerEnum{
        case cashier
        case cook
    }
    var name: String
    var salary: Double
    var post: WorkerEnum
}
var cashierVera = WorkerStruct(name: "Vera", salary: 30000, post: .cashier)
var cashierAnna = WorkerStruct(name: "Anna", salary: 30000, post: .cashier)
var cookAndrey = WorkerStruct(name: "Andrey", salary: 100000, post: .cook)
var cookVlad = WorkerStruct(name: "Vlad", salary: 70000, post: .cook)
var cookSveta = WorkerStruct(name: "Sveta", salary: 70000, post: .cook)

myPizzeria.addWorker(worker: cashierVera)
myPizzeria.addWorker(worker: cashierAnna)
myPizzeria.addWorker(worker: cookAndrey)
myPizzeria.addWorker(worker: cookVlad)
myPizzeria.addWorker(worker: cookSveta)

/*
    2. Создать класс столика, в нем должны быть свойство, в котором содержится
    количество мест и функция, которая на вход принимает количество гостей,
    которое хотят посадить, а возвращает true, если места хватает и false,
    если места не хватает. Изначальное количество мест задается в инициализаторе
*/
class Table{
    let seats: Int
    
//  У класса столика добавить свойство, в котором хранится пиццерия,
//  в которой стоит столик
    weak var pizzeria: Pizzeria?
    
    init(seats: Int, pizzeria: Pizzeria){
        self.seats = seats
        self.pizzeria = pizzeria
    }
    
    func isEnoughSeats(quantity: Int)-> Bool{
         seats >= quantity
    }
}
/*
    3. Добавить в класс пиццерии свойство, в котором хранится массив столиков.
    У класса столика добавить свойство, в котором хранится пиццерия, в которой
    стоит столик. Столики создаются сразу в инициализаторе, не передаются туда
    в качестве параметра
*/
