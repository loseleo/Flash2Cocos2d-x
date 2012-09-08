/*
Copyright 2011 Martin Jonasson, grapefrukt games. All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are
permitted provided that the following conditions are met:

   1. Redistributions of source code must retain the above copyright notice, this list of
      conditions and the following disclaimer.

   2. Redistributions in binary form must reproduce the above copyright notice, this list
      of conditions and the following disclaimer in the documentation and/or other materials
      provided with the distribution.

THIS SOFTWARE IS PROVIDED BY grapefrukt games "AS IS" AND ANY EXPRESS OR IMPLIED
WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL grapefrukt games OR
CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

The views and conclusions contained in the software and documentation are those of the
authors and should not be interpreted as representing official policies, either expressed
or implied, of grapefrukt games.
*/

package com.grapefrukt.exporter.extractors {
	import com.grapefrukt.exporter.misc.Child;
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Martin Jonasson, m@grapefrukt.com
	 */
	public class ExtractorBase {
		
		protected static function getChildren(sheet:DisplayObjectContainer, ignore:Array):Vector.<Child> {
			var children:Vector.<Child>;
			var mc:MovieClip = sheet as MovieClip;
			if (mc && mc.totalFrames > 1) {
				children = ChildFinder.findMultiframe(mc);
			} else {
				children = ChildFinder.findSingle(sheet);
			}
			
			ChildFinder.filter(sheet, children, ignore)
			
			return children;
		}
		
		protected static function classesToSheetSprite(sheetName:String, classes:Array):Sprite {
			var s:Sprite = new Sprite();
			s.name = sheetName;
			
			for each (var item:Class in classes) {
				var instance:Sprite = new item();
				instance.name = ChildFinder.getName(instance);
				s.addChild(instance);
			}

			return s;
		}
		
	}

}