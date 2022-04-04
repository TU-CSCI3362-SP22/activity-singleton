# Singleton Activity

Welcome to GEM's Candy Factory! We have a fully automated On Demand Candy factory with self-replicating robots! For the purposes of this activity, our robots are reading the transcript to decide what to do.

## Phase 1 - Brilliant Automation!
Browse through the different classes to get a feel for how the Candy Factory operates. You'll notice that there is a super class, `CandyOrder`, that has three subclasses for the three different kinds of candy our factory produces: `LollipopOrder`, `ChocolateBarOrder`, `ChocPBCupOrder`. There is also a `ChocBot` super class that has the factory's two types of robots in it: `WebChocBot` and `VoiceChocBot` which handle web orders and call in orders respectively. The robots also have the ability to replicate when passed multiple orders to keep the factory running at optimal speed. Browse through the robot's methods to get an understanding of how they work. Make sure to look at the class side for how a new robot gets created. (Also demonstrated in the store example)

If you take a look at `ChocStoreExample` you'll see a `testGoodDay` method and a `testBusyDay` method for running the factory. To get familiar with how GEM's Candy Factory run the following code in the playground to launch the example chocolate store. The syntax for `callInOrder` is funky, but dictated by our menu system so we can't change it!

```smalltalk
ChocStoreExample new testGoodDay
```

```smalltalk
ChocStoreExample new testBusyDay
```

## Phase 2 - One Star On Amazon?!
We have a problem! Our chocolate melter is running out of chocolate, and the robots are shipping empty candy packages!
The Candy Factory is processing orders with out regard for how much chocolate is being used by each order, and the bots don't realize when the chocolate melter is empty. Our customers are complaining! We need to track the chocolate in the melter so we don't issue invalid instructions to our robots.

1. To help the Candy Factory coordinate how much chocolate is used by each order, create a new class called `ChocolateMelter` to track how much melted chocolate the factory has in stock at any given time. 
   - `ChocolateMelter` needs a `supply` instance variable to hold the current amount of chocolate in stock.
      -  Don't forget to generate accessors for supply! 
   - When initialized the `ChocolateMelter` should hold 40 units of chocolate: what we place in the melter at the beginning of each day.
   - The `ChocolateMelter` is also going to need two methods:
     - `use:` will be called when an order is using chocolate. `use:` should take in an integer, and return true if there is enough chocolate to complete the order. Don't forget to update `supply` when chocolate is used!
     - `restockChoc` to be called when the chocolate melter is refilled.
     - `restockChoc` should print to the transcript that it is restocking the chocolate melter and then increase the supply by 40 units. 

2. Since every `ChocBot` needs to run orders through the `ChocolateMelter` they need to store the melter. 
   - Add an instance variable `chocMelter` instance variable to hold the instance of `ChocolateMelter.` Again, don't forget to generate accessors!
   - Edit the `ChotBot` class-side constructor method `withRoboName:` to also take in a `ChocolateMelter`. 

3. Next, we need to make sure that when orders are being filled that our `ChocBot`s are first checking that there is enough chocolate. 
   - Edit `fillOrders` to check each order to see if it can actually be filled, now that we are monitoring chocolate amounts. 
     - Hint: call `ChocolateMelter`'s `use` method on each order, and check the returned boolean.
     - If it cannot be fullfilled, just display an appropriate note on the transcript and leave the order unfullfilled. Tracking missing orders is a job for next week!

4. Finally, we need to make sure we intiialize the `ChocBots` correctly. Every `ChocBot` has to point to the same melter! Find every instance of a `ChocBot` being created, and ensure that they are all constructed with the same `ChocolateMelter`

Once you have everything to do with `ChocolateMelter` incorporated, run `testGoodDay` and `testBusyDay` again. Notice that you may have to call the `restockChoc` method when chocolate runs out, but thats okay! We need to know when the factory is out of chocolate.


### Takeaways
- What would happen if two instances of `ChocolateMelter` got instantiated? If the `ChocBot`s were operating off of different instances of `ChocolateMelter` when there is really only one in the factory then they might not be getting an accurate read on how much chocolate there is and process an order that can't actually be completed resulting in a customer getting a chocolate-less chocolate bar... which would not be good. 
- However, keep track of the chocolate boiler is tedious, and we aren't even making `ChocBot`s in very many places!
- Further, we have a parameter to a method **that only ever accepts a single value**! What's the point of a parameter that always has the same value?
- This is why the Singleton pattern is so great! It removes this possibility so that there can only ever be one instance of `ChocolateMelter`, ensuring all orders are processed correctly.

## Phase 3 -
Refactor your code to use the singleton pattern.

### Part 1: Override make a `getInstance` method
1. Add a `uniqueInstance` *class* variable to `ChocolateMelter`, which will hold the one instance of `ChocolateMelter`.
2. Create a class side constructor method called `getInstance`, which will check if `uniqueInstance` already has an instance of `ChocolateMelter`.
   - If it does, return it
   - Otherwise, set `uniqueInstance` equal to a new instance of `ChocolateMelter` - since it's being called for the first time!
3. Change the constructor of `ChocBot` to instead use `ChocolateMelter getInstance`. This ensures that it will always be the one instance of `ChocolateMelter` getting used throughout the code!

### Part 2: add an error to `new`
Note that `getInstance` makes it so that only one instance of `ChocolateMelter` is used, but we can't enforce it! Anyone can call `ChocolateMetlter new` and construct a second instance. To enforce this, we will override `new` in ChocoalateMelter` to throw the error: 

```smalltalk
^ self error: 'Class ', self name, ' can only have one instance. To retrieve it, send "ChocolateMelter getInstance"'
```

Now if you call `new` on `ChocolateMelter` that error message will pop up preventing any instance but the one we want of `ChocolateMelter` from ever getting created. But this breaks our use of `new` in `getInstance`! To fix this, you will have to manually create and intiailize the unique instance with `basicnew` and `initialize`.

When you run the test methods you'll see that everything still runs the same but now with the added protetion of hetting chocolate melters mixed up.

## Takeaways -
- The Singleton Pattern is that it is best used when there needs to be some class that should only ever have one instance in order to keep information consistent. This is done through overriding the public constructor of that class and creating a private constructor that checks if there is already an instance created. 
- The cases that you genuinely need a Singleton are fairly rare. In this example, we could have used a class variable in `ChocBot` to hold the singleton instead! However, if you have multiple (uninherited) classes that access the Singleton, that wouldn't work. 
- Singleton objects can also be implemented with class-side variables as methods: in other languages these are called static classes. However, this is considered bad practice: run-time information should generally not be stored in classes! In Smalltalk you can pass classes around, but in other languages static classes cannot be used as arguments, are are limited in how they can be updated.
