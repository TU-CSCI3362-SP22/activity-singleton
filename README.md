# Singleton Activity

Welcome to GEM's Candy Factory!

## Phase 1 - 
Browse through the different classes to get a feel for how the Candy Factory operates. You'll notice that there is a super class, `CandyOrder`, that has three subclasses for the three different kinds of candy our factory produces: `LollipopOrder`, `ChocolateBarOrder`, `ChocPBCupOrder`. There is also a `TaskManager` that handles all of the orders that customers can submit either through a `callInOrder` or a `webOrder`.

To get familiar with how GEM's Candy Factory operates copy and paste the following code into the playground. You can also try coming up with your own orders.

~insert tester code here~

But there's a problem! The Candy Factory is processing orders with out regard for how much chocolate is being used by each order and we are constantly running out and messing up orders! Continute on to Phase 2 to fix this problem.

## Phase 2 - 
We need our Candy Factory to have a way to coordinate how much chocolate is used by each order so we don't run out. To do this we will make a new class called `ChocolateMelter` that is going to keep track of how much chocolate the facory has in stock at any given time. `ChocolateMelter` needs a `supply` instance variable to hold the current amount of chocolate in stock. At the beginning of the day the `ChocolateMelter` holds 20 units of chocolate. (hint: don't forget to generate accessors for supply!)

The `ChocolateMelter` is also going to need two methods: `use` to be called when an order is using chocolate and `restockChoc` for when there isn't enough chocolate to complete an order and the `ChocolateMelter` needs to make more. 
   - `use` should take in an integer and return a boolean on if there is enough chocolate to complete the order. (Don't forget to update `supply` when chocolate is used)
   - `restockChoc` should print to the transcript that it is restocking the chocolate melter and then increase the supply by 40 units 

Since every `TaskManager` needs to run orders through the `ChocolateMelter` we'll need to assign it the chocolate melter. To do that we'll need:
   - a `chocMelter` instance variable to hold the instance of `ChocolateMelter` (again, don't forget to generate accessors!)
   - a class-side method called `assign: melter` which takes in the `ChocolateMelter` instance and when it makes an instance of `TaskManager` it'll assign `ChocolateMelter` to the variable `chocMelter`

Lastly, we need to make sure that when orders are being filled that our `TaskManager` is first checking that there is enough chocolate. To do this you'll need to edit `fillOrders` to check each order to see if it can actually be filled now that we are monitoring chocolate amounts. (Hint: call `ChocolateManager`'s `use` method on each order and depending on whether or not the order can be filled either run the current transcript show code to process the order or display an error that that specific order couldn't be filled and the `ChocolateMelter` needs to be restocked by calling the `restockChoc` method in the playground and trying that order again)

Once you have everything to do with `ChocolateMelter` incorporated, here are some orders to try and process. Notice that you may have to call the `restockChoc` method when chocolate runs out, but thats okay! We need to know when the factory is out of chocolate.

** What would happen if two instances of `ChocolateMelter` got instantiated? If `TaskManager`'s were operating off of different instances of `ChocolateMelter` when there is really only one in the factory then they might not be getting an accurate read on how much chocolate there is and process an order that can't actually be completed resulting in a customer getting a chocolate-less chocolate bar... which would not be good. This is why the Singleton pattern is so great! It removes this possibility so that there can only ever be one instance of `ChocolateMelter`, ensuring all orders are processed correctly.

## Phase 3 -
Refactor your code to use the singleton pattern.



## Takeaways -

