package components
{
	import effects.PageSlideLeft;
	import effects.PageSlideRight;
	
	import spark.components.ViewNavigator;
	import spark.transitions.ViewTransitionBase;
	
	public class CustomViewNavigator extends ViewNavigator
	{
		private var _viewClass:Class;
		private var _data:Object;
		
		// Used to figure out whether a view is added by Push or Pop action
		public static var previousAction:String;
		public static const ACTION_PUSH:String="PUSH";
		public static const ACTION_POP:String="POP";
		
		public function CustomViewNavigator()
		{
			super();
		}
		
		public override function pushView(viewClass:Class, data:Object=null, context:Object=null, transition:ViewTransitionBase=null):void
		{
			_viewClass=viewClass;
			_data=data;
			
			if (!transition)
				transition = PageSlideLeft.getInstance();
			
			previousAction = ACTION_PUSH;
			
			super.pushView(viewClass,data,context,transition);
		}
		
		public override function popView(transition:ViewTransitionBase=null):void
		{
			_viewClass=null;
			_data=null;
			
			if (!transition)
				transition = PageSlideRight.getInstance();
			
			previousAction = ACTION_POP;
			
			super.popView(transition);
		}
		
		public function doPreviousOperation():void
		{
			if(_viewClass)
				super.pushView(_viewClass,_data, null, PageSlideLeft.getInstance());
			else
				popView();
		}
	}
}