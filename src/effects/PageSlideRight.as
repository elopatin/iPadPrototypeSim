/*************************************************************************
 * ADOBE CONFIDENTIAL
 * ___________________
 *
 * Copyright 2011 Adobe Systems Incorporated
 * All Rights Reserved.
 *
 * NOTICE:  All information contained herein is, and remains
 * the property of Adobe Systems Incorporated and its suppliers,
 * if any.  The intellectual and technical concepts contained
 * herein are proprietary to Adobe Systems Incorporated and its
 * suppliers and may be covered by U.S. and Foreign Patents,
 * patents in process, and are protected by trade secret or copyright law.
 * Dissemination of this information or reproduction of this material
 * is strictly forbidden unless prior written permission is obtained
 * from Adobe Systems Incorporated.
 **************************************************************************/

package effects
{
	import spark.effects.easing.Power;
	import spark.transitions.SlideViewTransition;
	import spark.transitions.ViewTransitionDirection;
	
	public class PageSlideRight extends SlideViewTransition
	{
		private static var _instance:PageSlideRight = new PageSlideRight();
		
		public function PageSlideRight()
		{
			super();
			
			easer = new Power(.50, 4);
			direction = ViewTransitionDirection.RIGHT;
			
			if (_instance)
			{
				throw new Error("PageSlideRight is a singleton. Use getInstance()");
			}
		}
		
		public static function getInstance():PageSlideRight
		{
			return _instance;
		}
	}
}