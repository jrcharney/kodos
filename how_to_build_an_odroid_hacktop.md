# How to build a ODroid Hacktop
## Introduction
Building an Odroid Hacktop is more complex. Before I started using my ODroid as my primary Single-Board Computer (SBC), I used a Rasberry Pi B.  With the introduction of the Rasberry Pi B+, creating a hacktop is so much better.


# With Greater Power Comes a Greater Price Tag
The Odroid U3 is 16 times more powerful than the Raspberry Pi B+.  But it's also about three times the cost to establish once you get everything set up.  But that's the price we pay for having something just a little bit better.

I would like to compare that the Odroid U3 is about as powerful as a HP Mini netbook from 2009 which I had from about 2010 to 2013.  Should it be your primary computer? NO! It's too slow for that, but it should have the capablity running what you need for say if you're on the road and need to connect to a more powerfull machine.  I hope to explain how SSH, SSL, and VNC can help make that possible.

So why do this?  Because Linux can be lithe, if you know how to put it together properly and can lull yourself out of the convienences that Windows and OSX provides which really makes computer users slothful.  Linux, UNIX, and BSD are for people who like to do thing, but let's save that for the README.md.

So what's the pricetag part?  ODroid requires the purchase of a few more things to get it working.

This project will require a few more things as well.  Which means it won't be as cheap as the [Pi Hacktop](https://github.com/jrcharney/kang/blob/master/How_to_build_a_pi_hacktop.md) instructions I include with [Kang](https://github.com/jrcharney/kang)

## Caveats!
* **These instructions are for the Odroid U3. As much as I would like to get a [XU3](http://www.hardkernel.com/main/products/prdt_info.php?g_code=G140448267127), it's just not in my budget.
* **Shipping is $35 from Hardkernel in South Korea.** I know it sounds crazy.  I've bought pleanty of other things online from places like Hong Kong, Guangzhou, Beijing, Singapore, and Osaka, and I've never been charged $35 for international shipping.  (The second most was $5.)  Hopefully with the new Ameridroid shop, shipping is much less.
* **If you search for "20Ah Portable External battery" on Google or Amazon, it pulls up car batteries.**  Technically, the Anker Astro 2 has about as much power as a car battery, but it has about at least an 8 hour battery life. Which brings me to the next caveat.
* **Bring your chargers just because.** The Anker's battery will outlast the lapdock's battery by twofold.  Its a good thing but at the same time it kinda sucks because the lapdock's battery will run out of juice before the battery pack does.  I'm still thinking of what do do about that.  I'd really like to see a teardown of the lapdock where someone takes the battery out, but the only teardowns that I know of don't go that far.  (If you have pics of what the lapdock battery looks like, as well as model and manufacturing information, that would be great because I have a feeling it might be possible to put in a second set of battery cells for the lapdock so that the battery pack and the lapdock run out at the same time.)
* **BEWARE NOT TO GET MHL CABLES!** At least one retailer sold an MHL (Mobile High-Defintion Link) Cable as either a microUSB or microHDMI cable extension.  That is incorrect!
* **BEWARE NOT TO GET *MINI* CABLES!** miniUSB and miniHDMI are not the same as microUSB and microHDMI. Mini ports are larger than micro ports.
* **Avoid buying power adapter parts from Radio Shack.**  The Radio Shack of today isn't the Radio Shack from the 1980s I grew up with.  Parts could be defective or not work.  And lately, it just cost too much to buy anything from them.  In such a case as this project, that doesn't really seem to be a choice.  But if you can find something similar to the Enercell parts, I would highly recommend it!

## Recommendations
* **Buy local.** If you can get some of the items from Amazon, MicroCenter, or (heaven forbid) Radio Shack, then do so.  It's cheaper this way.  Don't be afraid to break out the yellow pages and find a local electronics shop whose name is not "Radio Shack".
* **MicroSD is still the way to go.** Hardkernel likes using eMMC memory modules.  But here in the United States, you can find microSD cards just about everywhere.  As much as eMMC touts speed, they're also more expensive.
* **Coaxal Barrel Adapters with with the EIAJ tips are OK!**  Despite what one of the local electronics parts retailers thinks, the Coaxal DC power adapters work great.  The fact that their polarity is indcated helps make this project easier.  The reason he doesn't like them is becaue they don't stay connected on their own.  Also depending on the manufacture, the plugs could be defective.  Finding the right plug will be the hardest part of this project as there really is no uniform standard and we can't use microUSB as a power supply like on the Raspberry Pi.

## What you'll need for this project

The following items you'll need to pick up from Hardkernel, Pollen, or Ameridroid:
* [Odroid U3](http://www.hardkernel.com/main/products/prdt_info.php?g_code=G138745696275)
* [Odroid U3 Case](http://www.hardkernel.com/main/products/prdt_info.php?g_code=G138750628451) (we'll sometimes refere to this as the "enclosure")
* [2.5mm DC Plug Cable Assembly](http://www.hardkernel.com/main/products/prdt_info.php?g_code=G138960965859) (Note, there is an alternative, I'll include it in this list. Still worth getting.)
* [RTC Battery Backup](http://www.hardkernel.com/main/products/prdt_info.php?g_code=G137508214939) (Basically this is a CR2032 clock battery wired up with two wires connected with a Molex connector. The battery is put in shrink plastic to protect it.  Still worth getting.)
* [U3 Cooling fan](http://www.hardkernel.com/main/products/prdt_info.php?g_code=G138760358261) (Sure it doesn't make the U3 as quiet. But if you know a way to minimize the noise let me know. Still worth getting.)
* [5V/2A Power Supply](http://www.hardkernel.com/main/products/prdt_info.php?g_code=G134111972476) (You'll need this until you get the parts for the battery pack set up.)

The following items you'll need to pick up from Amazon.  They must be exact.

* [DROK LM2596 Adjustable DC Voltage Regulator](http://www.amazon.com/gp/product/B00BYTEHQO/) (Apparently this thing is supposed to come with a heat sink.  I did not know that.  I'll need to make that adjustment on mine.)
* [Anker 2nd Gen Astro Pro2 20000mAh Portable External Battery Charger](http://www.amazon.com/gp/product/B005NGLTZQ/)

Everything below this line needs to be rewritten.

The following items you'll need to get from eBay. They must be exact!
* [Motorola Atrix Lapdock](http://www.ebay.com/sch/i.html?_nkw=Motorola+Atrix+lapdock) - Discontinued, but there are plenty out there on eBay. These were designed for the Motorola Atrix phone for AT&T.  It is almost analagous to the Motorola Droid Bionic sold by Verizon except the Bionic's microUSB and micro HDMI ports are in a different order.  This incompatibility is what killed the Lapdock market, and makes most Lapdocks a great find for under $100. (I'm not sure if the lapdock for the Droid Bionic will work.  If you get that instead, let me know how that turns out.  Be sure that it comes with a charger!)
* 30cm [microHDMI Female (type D) to microHDMI Male (type D) extension cable](http://www.ebay.com/itm/HDMI-1-4-D-type-Micro-HDMI-Male-to-Micro-HDMI-Female-M-F-Extension-Cable-30cm-/380701266032) Required to connect the microHDMI port on the Odroid to the microHDMI plug on the lapdock. (Well call this cable "Cable A")
* 30cm [microUSB Female to microUSB male extension cable](http://www.ebay.com/itm/Micro-USB-5-Pin-Female-to-Male-Extension-Data-Cable-30cm-Adaptor-Convertor-/201103692685) Required to connect the microUSB port on the Odroid to the microUSB plug on the lapdock. (Well call this cable "Cable B")

The following items you can pick up at an electronics shop.  These are the part numbers if you are going to Radio Shack, but look for something similar.:
* Enercell part 273-348: 6 feet of Adaptapower Power Cord. (22 Gauge wire, rated 24VDC @ 4A, 96W, 96VAC RMS, with an Adaptaplug socket on both ends.)  We will be cutting, stripping, and tinning this wire into two parts to create "Cable C" and "Cable D". 
* Enercell part 273-334: Adaptaplug tip A (2.35mm outer dia., 0.7mm inner dia.) (This will connect the Odroid to the Voltage regulator.) The cable we will create this part will be called "Cable C".
* Enercell part 273-335: Adaptaplug tip B (4.0mm outer dia., 1.7mm inner dia.) (This will connect the power pack to the Voltage regulator.)  The cable we will create with this part will be called "Cable D"

Pick up these two items from MicroCenter, or your local computer or office supply retailer:
* Wifi Dongle (I find Trendnet's N150 to be discreet as well as good enough for any Raspberry Pi or ODroid project.)
* A Class 10/U-1 microSD Card. 16 GB or larger (8 GB is NOT enough; you can get it cheap at MicroCenter) with a Kang image loaded on it. 32 GB is recommended.

The following items you can pick up at your local hardware store:
* A roll of electrical tape. (Coverup the really bright LEDs a bit.)
* A roll of industrial velcro. (10 foot roll. 1 inch wide. Black, with sticky ahesive backing.)
* Fabric Shears (for cutting the velcro.)
* A set of those small screwdrivers uses for electronics, but not necessary eyeglass repair. (You need a small flathead to dial up or down the voltage regulator)
* A small cardboard box. (If you get the Anker powerpack, I think there is one that is perfect. We want to put the voltage regulator in this so you don't spook people, especially at the airport.
* A roll of scotch tape. (Seal the cardboard box closed. Electric tape would be too much especially if you need to adjust the wires!)
* Wire cuttering & stripping tool.
* A soldering iron. (You won't need to solder anything, just tin a few wires to make sure they won't fray.)
* 63/37 Lead/Tin Solder. (For tinning your wires. It doesn't really need a rosin core, but it won't hurt if it does.) 

Take caution whem buying things from Ebay or retailers outside of your country.  With things like ["Rubber Duck"](https://hakshop.myshopify.com/collections/usb-rubber-ducky/products/usb-rubber-ducky-deluxe) devices that could easily be embedded into questionable products, most of them becoming more Chinese in origin, especially for computers, as a security caution, it would be best to stick with a reputable dealer either in the United States or within your own country. (Assuming your country isn't being a jerk about electronic privacy.  A trip to [EFF.org](https://eff.org/) might help.)  I'm trying to think of where is a good spot to get these items.

I prefer wires over adapters as adapters require the need for cutting or breaking something.  If we can avoid that, that would be much better.

I will post links to these items from a site that seems trustworthy enough in the future.

## SAFETY NOTICE! READ IT!

Because we will be handling tools, allow me to encourage you to read this quote by master carpenter Norm Abram who said this speech at the beginning of every episode of *New Yankee Workshop*.  Watching this show with my dad all those years, this speech has really rubbed off on me, especially in matters of safety, especially if you are using a soldering iron even for just a little bit.

> Before we get started, I'd like to take a moment to talk about shop safety.  Be sure to read, understand, and follow all the safety rules that come with your power tools.  Knowing that how to use your power tools *properly* will greatly reduce the risk of personal injury.
>
> And remember, there is no other important safety rule that to wear these... [points at his glasses] ...Safety glasses, and also hearing protection when necessary.

One other thing Norm may have not mentioned, especially when handing soldering irons as the hazardous chemicals associated, its important to work in a well ventilated area where the fumes and smoke are pulled away from you.  Don't do this in your kitchen or any place where you family eats or hangs out alot.  Do that in a garage or designated workplace.

## Instructions
Assuming you have all the parts, we can start creating our Odroid Hacktop.

### Part 1. Assembling the ODroid
1. Take the original fanless heatsink off the top side of the Odroid and replace it with the heatsink that has a fan. There should be a Molex slot to plug the fan in.
2. There are two LEDs on the top side of the Odroid, but they are very bright. One is for Power and one is for "Heartbeat" (activity)  If you find this annoying, we recommend cutting some very tiny electrical tape pieces and putting them on top of these LEDs, or at least 90% of the LED.  This will reduce the brightness which depending on the brand of electrical tape, will likely shine through, but not as badly.  There's also a product on the market for dimming bright LEDs but I find using electrical tape to be just as effective.
3. Plug the Real Time Clock (RTC) circuit into the RTC molex slot on the top side.  The RTC circuit will be bent to the bottom side of the of circuit when stored in the enclosure.
4. Install a microSD card or eMMC card with the Kodos Linux image installed on it on the bottom of the Odroid.
5. Put the Odroid in the enclosure.  I highly recommend NOT sealing the enclosure shut with any aheeasive even if it subseptible to popping open sometimes especially if you plan on using the GPIO, UART, or anything else on the top side of the board in the future.
6. On the bottom side of the enclosure, cut two pieces of soft side industrial Velcro.  Adhease the Velcro vertically (the shorter dimmension) to the case.  It may take a few hours for the adheasive on the Velcro to bond, so don't play with the Velcro backing for a bit.
7. Plug the WiFi Dongle into a USB port.
8. Plug Cable A into the HDMI mini port.
9. Plug Cable B into the USB mini port.

Later we will plug cable C into the power port.

It is important that when you are done using your ODroid, that you unplug Cables A and B from the lapdock because the LEDs on the lapdock still stay on and can spend some of the power lapdock. 

### Part 2. Assembing the Lapdock.
It is prefered that the rough side of the Velcro be put on the back of the lapdock.  Think of it as stacking legos.  Rough side goes on the up side.  The softside goes on the bottom.  We'll be doing this alot.

1. With the lapdock in the closed position, prepare to adhease the Odroid to the back of the screen.  **DO NOT** place it near the hinge!  Instead put it two inches above the hinge such that the enclosure can't touch hinges and the wires can connect freely.
2. The second piece should be put about 1 1/2 inches above that piece, parallel to that piece.  Don't forget to use the rough side.  This won't measure the width of the the Odroid like the Raspberry Pi instructions, but I've found this to be important for keeping the batter pack velcroed to the back of the screen without ripping on the back of the screen or wrecking the screen.
3. Add one more strip 1 1/2 inches above that piece.

### Part 3. Assembling the Powerpack.
The Anker Astro Pro 2 is the heaviest item that we will place on the backside of the screen.  It weighs in at a heavy 1 pound, even with it's lithium phosphate battery.  It is for this reason, I am still looking for an alternative to put all the Odroid components in some kind of drawer that locks on to the bottom of the lapdock.

On the other hand, with 20000 mAh (milliampere-hours), that's like hooking up a car battery to your computer, minus about 20 pounds and in a very slim form factor.

There was going to be a big section on the math used for calculate the power requirements.  But let's say there is one constant you should know: 2 Amperes.  Thats how much power the Anker Pro can put out when it is in 9V mode.  There is a 12 Volt mode where the current is less, but that's what we don't want to use.  This part is going to be easy.

1. Set the Anker Astro Pro 2 to 9V/2A mode.
2. Put a strip of  soft side of  velcro on the back side of the Anker Astro Pro 2.  Do NOT cover the voltage information printed on the back.  This will generally be a 1/4 inch from the bottom of the battery pack.  
3. Put a second strip of soft side  1 1/2 inch above that strip.
4. On the front side, put a strip of rough side 1/4 inch from the bottom.
5. Put a second strip of rough side 1 1/2 inch above that strip.
6. Stick the power pack on the back of the lapdock sideways with the USB ports facing outward, but it to be ABOVE the hinge NOT AT the hinge.

### Part 4: Voltage Regulator
Setting up the Voltage regulator is probably the most complex part of this project.  It involves some soldering.  It involves some electronic stuff.  It involves doing some stuff to make your computer look as minimally evil as possible, because it's not evil.

1. Using wirecutters cut about 8 inches of wire from the end of the adaptapower cable.
2. Because this wire can be separated at the end. separate the two wires at the end by about a 1/2 inch or less.
3. Strip the wires about 1/2 inch from where they were cut.
4. Twist the copper of the wires to keep them from fraying. I highly recommend this!
5. Using hot a hot soldering iron, LIGHTLY coat the twisted copper with BARELY A DROP of solder so that the each wire has a nice silvery coat to keep the wires from fraying or untwisting.  This is called *tinning the wires*.  This step is optional, but is a good idea.  YOU NEED NO MORE THAN A DROP OR LESS PER WIRE! Use the soldering iron to smear that drop along the copper, but avoid touching the plastic.  DO THIS IN A VENTILATED ROOM WHERE THE SMOKE AND FUMES CAN BE SUCKED AWAY FROM YOU! AVOID INHALING THE FUMES AS THEY ARE TOXIC!  DO NOT TOUCH THE HOT SOLDERING IRON! BE SURE TO UNPLUG THE SOLDERING IRON WHEN YOU ARE DONE USING IT! DO NOT LEAVE THE HOT SOLDERING IRON UNATTENDED!  NOT HEEDING THESE WARNING CAN RESULT IN IMJURY OR DEATH!  I'M NOT RESPONSIBLE IF FOR YOU HURTING YOURSELF OR OTHERS! If you can't handle doing any of that, don't do this step and go to the next step.
6. If your power adapter didn't come with an aheasive heatsink, try using one of the alumninum heat sinks that came with a Raspberry Pi.  You can pick these up on Amazon for $5 if you don't have any, but one should go on top of the black module near the top and left of center of the module.  If you bought it with one, you can ignore this step.
7. When the wires are cool, you can insert the tips of each wire into the screw ports on the sides of the voltage adapter.  The side of the wire with the white strip should go into the positive slot and the one with out should go into the negative slot.  These are held together using screw.  Use a small screwdriver to secure the wires to the voltage regulator.  The wire that goes to the battery pack goes on the left, and the one that goes to the odroid goes on the right.
8. Complete Cable D by pluging tip B into wire on the left side. We will need to check if we plugged it into the right direction before we secure the connection with electrical tape later.
9. Complete Cable C by plugging tip A into the the right side. We will need to check if we plugged it into the right direction before we secure the connection with electrical tape later.
10. Plug Cable C into the Odroid with the lapdock lid open. We won't need to run the computer very long, we just need to test if the computer operates at the voltage when we dial it in later.
11. Plug Cable D into the Powerpack.  A green light should come on on the voltage regulator.  If it doesn't change the direction of plug.  If it still doesn't come on, check again, and a thrid time to be sure.  If it doesn't work, it's a bum connector. (Remember what I said about buying parts from Radio Shack?  That's why I included the measurements of the plugs.)
12. Assuming everything works on the D Side, plug cable C into the power port on the Odroid.
13. Adjust the dial on the voltage regulator using a small screwdriver.  At about 4.7 Volts, the Odroid should pop on, but you should set it to as close as 5.0 Volts as possible.  But don't go over 5.2 or you might burn out your Odroid any you're going to hate yourself.  We recommend tuning it to 4.9 Volts but as close to 5.0 as possible to be safe.  It will likely fluxuate between 5.0 and 4.7 sometimes.  But it will die if below 4.5V.  The reason we use an adjustable Voltage regulator is so that we can fine tune the voltage.  If successful, unplug everything.  Try not to keep anything on long enough to boot up the machine just yet.
14. With everything set up, we can now use electrical tape to wrap the connectors on Cables C and D to their wires securely so they don't pop out.  I recommend sticking a label on Cable D that says "DO NOT UNPLUG!" as a reminder not to unplug Cable D when the device is in use, which could happen more likely than with Cable C.
15. If your voltage regulator came with screws, you can probably skip this step.  Either we can now stick a small square of rough side velcro in the middle of the backside of the Voltage Regulator.  This is ok, although using screws would be better. if you have them.
16. If you have a small box (which probably came with the Anker Pro2 Power Pack), use that as an enclosure for the voltage regulator.  If you don't have screw, stick a soft side square of velcro in the center of the inside of the box and stick the voltage regulator there.
17. I recommend letting Cables C and D stick out in the bottom corners of the box on the side that the voltage regulator is stuck on. This should be on the downward side when velcroed to the lid and the lid is open.  Close the flaps and secure them shut with Scotch tape both veritcally and horizontally.  If you are good with an Xacto knife, try carving a face into the top/front of the box, but cover it with a small piece of saran wrap so the voltage regulator stays clean. Secure with Scotch tape if you do this.
18. Stick a strip of softside Velcro longways on the bottom/back of the box that the voltage regular is stuck on. 

### Part 5: Assembling the modules.

With all the parts ready, lets put things together.

1. Stick the Powerpack sidewasy with the USB ports outward towards the rightside of the keyboard but not blocking the hinge.
2. Stick the Odroid on the middle strip on the back of the lapdock on the left side.  Do not put it on the bottom strip as it will block the cable hinge and the screen hinge.  The Odroid should be pointed upward such that the USB ports are upward as well as the power, microHDMI, and microUSB are UPWARD, not downward. Trust me on this.
3. Loop the microHDMI and microUSB cables backward toward the cable copartment.  Whenever you are don using your Odroid, you should disconnect these cables here so that the lapdock battery doesn't keep running.  You can keep the power plug plugged into the ODroid.
4. Stick the voltage regulator onto the top velcro strip in the center with the wires pointed downward towards the Odroid and the Powerpack's DC ports.

This rocket is ready to launch!

![Odroid Hacktop Closed](https://pbs.twimg.com/media/B5PEOa3IEAEJ9gI.jpg)

![Odroid Using VNC](https://pbs.twimg.com/media/B5PFaYXIUAEW2WR.jpg)

More photos on my Twitter.
* [Four photos](https://twitter.com/JRCharney/status/525028693979459585)
* [Four more photos](https://twitter.com/JRCharney/status/525029004605423616)
* [And one more](https://twitter.com/JRCharney/status/525029454461296640)
* [With the parts scattered](https://twitter.com/JRCharney/status/525923947573805057)

## Operation
To turn the device on you need to do a few things:

1. Make sure the device is assembled like in Part 5 of the previous section.
2. Open the lid of the laptop. Make sure that the powerpack is not obstructing the hinges or plugs on the backside.
3. Plug in Cable D.  It may take a couple of seconds for the power to flow from the battery pack but when it does reach the voltage regulator, the green light should come on and the power and heartbeat lights on the Odroid shortly after.
4. Wait for the machine to boot up.
5. Choose your desktop environment from the prompt.  I hope to have Kodos running fluxbox or an improved version of LXDE that supports Chrome.
5. Login.  The default user is `odroid`.
6. Enter your password.  If you haven't changed the password from `odroid` for both the users `odroid` and `root`, you should do it with `chpasswd`.

And that's it.

## Shutdown
The command line way of shutting down is `sudo shutdown -h now`, but be sure to close all other applications first if you can.

The GUI way is to go to the application menu and select `Shutdown` and say `Yes` to the prompt.  I still need to create Kodos first.

## A few notes
* You'll need to have two power adapters: One for the lapdock and one for the power pack.
* If Wifi doesn't work on startup, try unplugging the Wifi dongle and plugging it back in.  If it still doesn't work, you may need to hook up the Odroid to a router via Eithernet.  But that is why I recommend that any distro be loaded with Wifi drivers preinstalled.  Kodos is such a distro.
* It's OK to close the lid, for a little while at least.  I wouldn

## A few more Caveats
* **Odroid is still uses an ARM processor.**   It may be 16 times faster and a Raspberry Pi B or B+, but if you want to use i386 or x86_64 stuff, you'll need to use a desktop.  If you are looking for something faster, I would suggest using a laptop or desktop.
* **Don't leave the ODroid run on the battery for days on end.**  If you are going to do that and not go anywhere, use the ODroid's big ugly plug.  It's on the shopping list for a reason.  (Hey, Odroid guys, Make it less ugly!)
* **Be sure to take it apart before going to the airport.**  In a post 9/11 world, there's bound to be [some fool who thinks your harmless computer project is malevolent](https://www.youtube.com/watch?v=BfilaKrnAhQ).  Until there is a way to enclose all the "spooky parts", we've designed these instructions to be modular.  So when the TSA asks you "What's this thing" you can say in their face "[This is a computer!](https://www.youtube.com/watch?v=ZLaDvSRPkX8) I built it. I'm proud of it. And I would prefere that your dirty latex gloves that have been touching other people's dirty sweaty bodies all day not touch it, thank you very much!"  I'm not sure how they would react, but there are enough places in this world where you need to get an intimate pat down.

## What do do after you've done this
I recommend using your Hacktop in conjunction with a more powerful computer, like a desktop or laptop.  You can use SSH, SSL, and VNC on this to remotely access a more poweful machine.  I plan on writing something about that later.

But if you're looking for something to do some quick hacking on the go, or if you're completely new to Linux and want to use Scratch or the other resources for new programmers to use to get started with making stuff on a computer, this setup is idea.

I'm hoping to include some game emulation just for fun.  Doom, Quake, Minecraft, Old Video Games.

