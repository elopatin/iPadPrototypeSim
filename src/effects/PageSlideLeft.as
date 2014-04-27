package effects
{
	import spark.effects.easing.Power;
	import spark.transitions.SlideViewTransition;
	import spark.transitions.ViewTransitionDirection;
	
	public class PageSlideLeft extends SlideViewTransition
	{
		private static var _instance:PageSlideLeft = new PageSlideLeft();
		
		public function PageSlideLeft()
		{
			super();
			
			easer = new Power(.50, 4);
			direction = ViewTransitionDirection.LEFT;
			
			if (_instance)
			{
				throw new Error("PageSlideLeft is a singleton. Use getInstance()");
			}
		}
		
		public static function getInstance():PageSlideLeft
		{
			return _instance;
		}
	}
}