# Piron Games Haxe/Flash GameLib 2.0
It's a game development library/framework, written in Haxe 2 and targeting Adobe Flash. As both these technologies are obsolete, there's no real use for it.

The library was used between 2010-2012 to develop Adobe Flash games, namely: [SuperChicken Battles The Penguin Horde](https://www.pirongames.com/superchicken-battles-the-penguin-horde/), [Loose Cannon Physics](https://www.pirongames.com/loose-cannon-physics/), [Knight And Witch](https://www.pirongames.com/knight-and-witch/) and an alpha version of [Laser Lab](https://www.pirongames.com/laser-lab/).

The reason at that time was to support more complex games with improved performance, as the previous library performance and architectural limits peaked in Born Of Fire TD. Its development was initially tied with the SuperChicken game.

The main features are:
* scene graph (a "loose" port/adaptation of jMonkeyEngine for 2D games);
* support for patterns (Entity-Component-System, pooling, observer);
* UI support via microvcl, with additional visual components and behaviours ("tactics");
* [Sentry](https://github.com/stefandee/gametoolkit) sprites loading and rendering;
* localization system (requires [StringTool](https://github.com/stefandee/gametoolkit) with [StringScript_AS30_ByteArray.csl](tools/StringTool/StringScript_AS30_ByteArray_Lang.csl) export script to convert data from a master sheet to a format usable by the library);
* leaderboards support (flexible to match any external leaderboard storage);
* site-locking and black-listing of hosting sites;
* cryptography support (to protect in-game memory data from direct search and tampering via CheatEngine, e.g. scores, resources counts, etc).

A port to Haxe 3 and OpenFL was made in 2018, with the aim of releasing the aforementioned games to modern platforms like HTML5. It may be found at [hxgamelib2-openfl](https://github.com/stefandee/hxgamelib2-openfl).

## Usage
Source code works for Haxe 2.05 and possibly 2.10, with Adobe Flash output target. May also work for other targets.

While the library doesn't direcly requires them, the included samples and any project using it would need tools from the [Piron GameToolkit](https://github.com/stefandee/gametoolkit), for specific usages:
* the built-in sprite system uses Sentry;
* the built-in l10n system uses StringTool;

Pre-built binaries of the Piron GameToolkit are available for [download here]((https://github.com/stefandee/gametoolkit/releases/tag/win-v100)).

Additionally, SamHaxe ([1](https://github.com/overmobile/samhaxe), [2](https://github.com/robinp/samhaxe-open)) was used to assemble resources into a data SWF, accesible through bindings, like so:
```haxe
@:bind class Data_Lang extends ByteArray {}
@:bind class Data_SprLib extends ByteArray {}
```

Data building scripts require Perl. These are:
* makedatalib.pl merges together files in a folder and also outputs Haxe definitions to easily access them (useful for creating a sprite "library");
* makelanglib.pl converts all localization XML files in a folder, merges the outputs and generates Haxe definitions;
* makepbl.pl creates a RC4 blacklist Haxe definitions based on a list of sites (this was used to prevent the game from running on sites that were known to block ads or outgoing links).

The library is modular, so you can use your own systems and tooling for sprites or localization and ignore the built-in ones.

## License

Code license:
https://opensource.org/licenses/MIT

