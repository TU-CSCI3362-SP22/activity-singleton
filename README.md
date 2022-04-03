# Singleton Activity

Welcome to GEM's Candy Factory! We have a fully automated On Demand Candy factory with self-replicating robots! For the purposes of this activity, our robots are reading the transcript to decide what to do.

## Phase 1 - 
Browse through the different classes to get a feel for how the Candy Factory operates. You'll notice that there is a super class, `CandyOrder`, that has three subclasses for the three different kinds of candy our factory produces: `LollipopOrder`, `ChocolateBarOrder`, `ChocPBCupOrder`. There is also a `ChocBot` super class that has the factory's two types of robots in it: `WebChocBot` and `VoiceChocBot` which handle web orders and call in orders respectively. The robots also have the ability to replicate when passed multiple orders to keep the factory running at optimal speed. Browse through the robot's methods to get an understanding of how they work. Make sure to look at the class side for how a new robot gets created. (Also demonstrated in the store example)

If you take a look at `ChocStoreExample` you'll see a `testGoodDay` method and a `testBusyDay` method for running the factory. To get familiar with how GEM's Candy Factory run the following code in the playground to launch the example chocolate store. 
*The syntax for `callInOrder` is funky, just go with it

```smalltalk
ChocStoreExample new testGoodDay
```

```smalltalk
ChocStoreExample new testBusyDay
```

But there's a problem! The Candy Factory is processing orders with out regard for how much chocolate is being used by each order and we are constantly running out and messing up orders! Continute on to Phase 2 to fix this problem.

## Phase 2 - 
We have a problem! Our chocolate melter is running out of chocolate, and the robots are shipping empty candy packages! We need to track the chocolate in the melter so we don't issue invalid instructions to our robots.

To help the Candy Factory  coordinate how much chocolate is used by each order, create a new class called `ChocolateMelter` that is going to keep track of how much chocolate the facory has in stock at any given time. `ChocolateMelter` needs a `supply` instance variable to hold the current amount of chocolate in stock. Don't forget to generate accessors for supply! At the beginning of the day the `ChocolateMelter` holds 40 units of chocolate.

The `ChocolateMelter` is also going to need two methods: `use` to be called when an order is using chocolate and `restockChoc` to be called when the chocolate melter is refilled.
   - `use` should take in an integer, and return true if there is enough chocolate to complete the order. Don't forget to update `supply` when chocolate is used!
   - `restockChoc` should print to the transcript that it is restocking the chocolate melter and then increase the supply by 40 units. 

Since every `ChocBot` needs to run orders through the `ChocolateMelter` we'll need to assign it the chocolate melter. To do that we'll need:
   - a `chocMelter` instance variable to hold the instance of `ChocolateMelter` (again, don't forget to generate accessors!)
   - edit the `ChotBot` class-side method `withRoboName` to also take in a `ChocolateMelter`

Lastly, we need to make sure that when orders are being filled that our `ChocBot`s are first checking that there is enough chocolate. To do this you'll need to edit `fillOrders` to check each order to see if it can actually be filled now that we are monitoring chocolate amounts. (Hint: call `ChocolateMelter`'s `use` method on each order and depending on whether or not the order can be filled either run the code to process the order or display an error that that specific order couldn't be filled and the `ChocolateMelter` needs to be restocked by calling the `restockChoc` method in the example store method and trying that order again)

Once you have everything to do with `ChocolateMelter` incorporated, run `testGoodDay` and `testBusyDay` again. Notice that you may have to call the `restockChoc` method when chocolate runs out, but thats okay! We need to know when the factory is out of chocolate.


** What would happen if two instances of `ChocolateMelter` got instantiated? If the `ChocBot`s were operating off of different instances of `ChocolateMelter` when there is really only one in the factory then they might not be getting an accurate read on how much chocolate there is and process an order that can't actually be completed resulting in a customer getting a chocolate-less chocolate bar... which would not be good. This is why the Singleton pattern is so great! It removes this possibility so that there can only ever be one instance of `ChocolateMelter`, ensuring all orders are processed correctly.

## Phase 3 -
Refactor your code to use the singleton pattern.

#### Part 1: Override make a `getInstance` method
First, add a `uniqueInstance` class variable to `ChocolateMelter` to hold the one instance of `ChocolateMelter`.
Next, create a class side method called `getInstance` to check if `uniqueInstance` already has an instance of `ChocolateMelter`. If it does, return it; otherwise, set `uniqueInstance` equal to a new instance of `ChocolateMelter` (this would be if it's being called for the first time).

Now replace the places where you were origianlly sending ChocolateMelter around with `ChocolateMelter getInstance`. This insures that it will always be the one instance of `ChocolateMelter` getting used throughout the code.

#### Part 2: add an error to `new`
Now that `getInstance` makes it so that only one instance of `ChocolateMelter` is used we need to make sure we can't call new on `ChocolateMelter`. To do this make a class side method called `new` to override the original new method and have it return this:

```smalltalk
^ self error: 'Class ', self name, ' can only have one instance. To retrieve it, send "ChocolateMelter getInstance"'
```

Now if you call `new` on `ChocolateMelter` that error message will pop up preventing any instance but the one we want of `ChocolateMelter` from ever getting created.
You'll need to replace your call to `new` in `getInstance` to make the method look like this:

```smalltalk
uniqueInstance isNil
		ifTrue: [ uniqueInstance := self basicNew initialize].
		^ uniqueInstance 
```
When you run the test methods you'll see that everything still runs the same but now with the added protetion of hetting chocolate melters mixed up.

## Takeaways -
The key takeaway from the Singleton Pattern is that it is best used when there needs to be some class that should only ever have one instance in order to keep information consistent. This is done through overriding the public constructor of that class and creating a private constructor that checks if there is already an instance created.
