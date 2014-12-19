# How to build a ODroid Hacktop
## Introduction
Building an Odroid Hacktop is more complex. Before I started using my ODroid as my primary Single-Board Computer (SBC), I used a Rasberry Pi B.  With the introduction of the Rasberry Pi B+, creating a hacktop is so much better.

THIS DOCUMENT IS STILL BEING WRITTEN!

# With Greater Power Comes a Greater Price Tag
The Odroid U3 is 16 times more powerful than the Raspberry Pi B+.  I would like to compare that the Odroid U3 is about as powerful as a HP Mini netbook from 2009 which I had from about 2010 to 2013.  Should it be your primary computer? NO! It's too slow for that, but it should have the capablity running what you need for say if you're on the road and need to connect to a more powerfull machine.  I hope to explain how SSH, SSL, and VNC can help make that possible.

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
* **Avoid buying power adapter parts from Radio Shack.**  The Radio Shack of today isn't the Radio Shack from the 1980s I grew up with.  Parts could be defective or not work.  And lately, it just cost too much to buy anything from them.

## Recommendations
* **Buy local.** If you can get some of the items from Amazon, MicroCenter, or (heaven forbid) Radio Shack, then do so.  It's cheaper this way.
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
* Enercell part 273-348: 6 feet of Adaptapower Power Cord. (22 Gauge wire, rated 24VDC @ 4A, 96W, 96VAC RMS, with an Adaptaplug socket on both ends.)
* Enercell part 273-334: Adaptaplug tip A (2.35mm outer dia., 0.7mm inner dia.)
* Enercell part 273-335: Adaptaplug tip B (4.0mm outer dia., 1.7mm inner dia.)

Everything below this line needs to be rewritten.

The following items you'll need to get from eBay. They must be exact!
* [Motorola Atrix Lapdock](http://www.ebay.com/sch/i.html?_nkw=Motorola+Atrix+lapdock) - Discontinued, but there are plenty out there on eBay. These were designed for the Motorola Atrix phone for AT&T.  It is almost analagous to the Motorola Droid Bionic sold by Verizon except the Bionic's microUSB and micro HDMI ports are in a different order.  This incompatibility is what killed the Lapdock market, and makes most Lapdocks a great find for under $100. (I'm not sure if the lapdock for the Droid Bionic will work.  If you get that instead, let me know how that turns out.  Be sure that it comes with a charger!)
* 30cm [microHDMI Female (type D) to microHDMI Male (type D) extension cable](http://www.ebay.com/itm/HDMI-1-4-D-type-Micro-HDMI-Male-to-Micro-HDMI-Female-M-F-Extension-Cable-30cm-/380701266032) Required to connect the microHDMI port on the Odroid to the microHDMI plug on the lapdock. (Well call this cable "Cable A")
* 30cm [microUSB Female to microUSB male extension cable](http://www.ebay.com/itm/Micro-USB-5-Pin-Female-to-Male-Extension-Data-Cable-30cm-Adaptor-Convertor-/201103692685) Required to connect the microUSB port on the Odroid to the microUSB plug on the lapdock. (Well call this cable "Cable B")


The following items you can pick up at any retail shop.
* A roll of electrical tape. (Coverup the really bright LEDs!)
* A roll of industrial velcro. (10 foot roll. 1 inch wide. Black, with sticky ahesive backing.)

* A Raspberry Pi B+ enclosure (if you have a Pi B, then Pi B enclosure.)
* Stick-on heat disappators
* A Motorola Atrix Lapdock (search eBay!) (Don't get the Motorola 100 or 500 Lapdock.  I think the Lapdock for the Motorola Droid Bionic should be OK. The only difference is that the Atirx and Bionic's microUSB and microHDMI ports are on different sides.) Be sure that it comes with the charger.
* A Class 10/U-1 microSD Card. 16 GB or larger (8 GB is NOT enough; you can get it cheap at MicroCenter) with a Kang image loaded on it. 32 GB is recommended.
* Wifi Dongle (I find Trendnet's N150 to be discreet as well as good enough for any Raspberry Pi or ODroid project.)
* A roll of black industrial Velcro. (About 10 feet. You can find this at your local hardware store. The width should be 1 inch.)
* A pair of fabric shears (used to cut the Velcro)
* 6 to 8 inch USB male (USB male A) to microUSB female cable. We will call this cable "Cable A". (See note below.)
* 10 to 12 inch HDMI male (HDMI type A male) to microHDMI female (HDMI type D female) cable. We will call this cable "Cable B". (See note below.)
* 6 to 8 inch microUSB male to USB male (USB male A) cable.  We will call this cable "Cable C". (See note below.)

The last three items on this list will be hard to find, but it is important that you do not go on to eBay to get them.  With things like ["Rubber Duck"](https://hakshop.myshopify.com/collections/usb-rubber-ducky/products/usb-rubber-ducky-deluxe) devices that could easily be embedded into questionable products, most of them becoming more Chinese in origin, especially for computers, as a security caution, it would be best to stick with a reputable dealer either in the United States or within your own country. (Assuming your country isn't being a jerk about electronic privacy.  A trip to [EFF.org](https://eff.org/) might help.)  I'm trying to think of where is a good spot to get these items.

I prefer wires over adapters as adapters require the need for cutting or breaking something.  If we can avoid that, that would be much better.

I will post links to these items from a site that seems trustworthy enough in the future.

## Instructions
1. Assemble Raspberry Pi by putting the B+ into the B+ enclosure.  Be aware that the B+ enclosure at MicroCenter needs to be put in in a certan direction so that the B+ clips into the enclosure.
2. Stick on the heat disappator.  There should be a larger one that sicks on top of the CPU and a smaller one that sticks on top of the smaller processor.  
3. Add any Pi accessory like a GPIO cable (sold separately) or Camera module (sold separate) or various shields. If you can, then put the top half of the enclosure on. 
4. Place two pieces of industrial velcro on the bottom half of the Pi enclosure.  Do not cover any of the slots or the two mounting holes.  I recommend putting the soft side on the Enclosure and the rough side on the lapdock.  Also, put the rough and soft sides together then use sewing shears to cut a two pieces of slightly smaller than the lenght of the enclosure pieces.  Take the plastic backing off the soft side when sticking onto the enclosure, but not the rough side until we get to the lapdock step.  Industrial velcro is not effective unless the adhesive on the back of the soft and rough sides are stuck on the hard surfaces for more than a few hours.  Choose where to put it wisely!  Alternatively, cutting two long strips of rough side and sticking them at a parallel distance as the softsides on the enclosure might be a good idea, especially if you upgrade to an Odroid or get another Pi. The first piece 2 inches from the hinge of the lapdock and the second piece about 1 1/2 inches above that. (Do that around step 9 later in these instructions.)
5. Plug the WiFi dongle into one of the four USB female slots. The top one in the middle is the best spot.
6. Plug Cable A into a USB female slot.  We recommend the one below where you plugged in the WiFi dongle.
7. Plug Cable B into the HDMI female slot.
8. Plug Cable C into the microUSB female slot.  If you have a Raspberry Pi model B (not B+), this step can be skipped.
9. With the laptop in the closed position, prepare to adhease the Raspberry Pi to the back of the screen.  **DO NOT** place it near the hinge!  Instead put it two inches above the hinge such that the enclosure can't touch hinges and the wires can connect freely.  The second piece should be put about 1 1/2 inches above that piece, parallel to that piece.  It is prefered the rough side is aheased to the back of the monitor rather than the softwide.
10. Open the lapdock, and watch the machine boot up.  If Wifi still doesn't work, you may need to hook up the Pi to a router via Eithernet.  But that is why I recommend that any distro be loaded with Wifi drivers preinstalled.  Kang is such a distro.

## A few caveats!
* **Raspberry Pi is SLOOOOOOOOW.** [insert turtle emoji here].  If you are looking for something faster, I would suggest using an ODroid.  The Kodos project has the instructions for building an Odroid lapdock.
* **NEVER CLOSE THE LID!**  The lapdock will stay operational as long as the lid stays open.  If you close the lid, even for a second, it powers off.  Odroid lapdocks don't have that problem.
* **B+ needs power from the Lapdock, NO EXCEPTIONS!**  If you read the instructions for Kodos on hwo I managed to get power supplied to the Odroid, you may have noticed I used a powerpack.  With the B+, you can't really use this hack.  Sure, you can run the B+ off of a powerpack (i.e. the Anker Astro E4 external battery), but plug the B+'s power into a battery pack and you'll get nothing when you open up the lapdock.  If you are to run the B+, you MUST have the MicroUSB power port plugged into one of the Lapdocks USB ports.  Not the microUSB plug next to the microHDMI plug.  You standard USB Type A outlet.  Older Pi B users don't need to worry about this.  Pi B+ users still get the advantage of one extra USB port even with this setup.
* **Don't use Adapters to do a Cable's Job.**  As I previously stated, I prefere using cables over a whittled set of adapters.  Sure, a couple of the cables are hard to find, but if you can get them, get them!
* **Be sure to take it apart before going to the airport.**  In a post 9/11 world, there's bound to be [some fool who thinks your harmless computer project is malevolent](https://www.youtube.com/watch?v=BfilaKrnAhQ).  Until there is a way to enclose all the "spooky parts", we've designed these instructions to be modular.  So when the TSA asks you "What's this thing" you can say in their face "[This is a computer!](https://www.youtube.com/watch?v=ZLaDvSRPkX8) I built it. I'm proud of it. And I would prefere that your dirty latex gloves that have been touching other people's dirty sweaty bodies all day not touch it, thank you very much!"  I'm not sure how they would react, but there are enough places in this world where you need to get an intimate pat down.

## What do do after you've done this
I recommend using your Hacktop in conjunction with a more powerful computer, like a desktop or laptop.  You can use SSH, SSL, and VNC on this to remotely access a more poweful machine.  I plan on writing something about that later.

But if you're looking for something to do some quick hacking on the go, or if you're completely new to Linux and want to use Scratch or the other resources for new programmers to use to get started with making stuff on a computer, this setup is idea.
