   M S B A M L   `   `   `  ����U  QLiveCharts.Wpf, Version=0.9.7.0, Culture=neutral, PublicKeyToken=0bc1f845d1ebb8dfG4clr-namespace:LiveCharts.Wpf;assembly=LiveCharts.WpfLiveCharts.Wpf  5   	   L HVolatilityTracker, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null5clr-namespace:VolatilityTrackerVolatilityTracker 5   	   "   VolatilityTracker.MainWindow   5   	   W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   V RMaterialDesignThemes.Wpf, Version=2.5.0.1205, Culture=neutral, PublicKeyToken=nullFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5   	   >lvc4clr-namespace:LiveCharts.Wpf;assembly=LiveCharts.Wpf  5   	   7VolatilityTrackerclr-namespace:VolatilityTracker  5   	   $	��600��5	      $
��1024��6'     � WindowStyle$
  None=�64    � 
ResizeMode$ CanResizeWithGrip=�6G    � AllowsTransparency .  � 	Resources 5
      +  %VolatilityTracker.ZoomingModeCoverter   ZoomingModeCoverter��%   &	          5   
   6N   5      .��5      � 
������� � ColumnDefinitions 5   
   �� 5      $	��200 �6   �� 5      $��* �6    � RowDefinitions 5   
   �� 5      $��30 �6   �� 5      $��* �6   .+�5   
   � $��1��6   $��1��6   ���	#FFDDDDDD 5      �� 5      $
��115* �6#   �� 5      $
��684* �6#   �� 5      $	��17* �6#   .+�5      �� $��3��6   .��5      �  5       �� 5!      $	��200 �6(   �� 5"      $��* �6(    5$      �� 5%      $��1* �6+   �� 5&      $��1* �6+   �� 5'      $��1* �6+   .+�5*      � $��0��6   .+�5+      �� $	��150��6$   $��20q�61   
������� �� RadiusX$ 10��6J    �� RadiusY$ 10��6W    J� Effect 5,      3  -System.Windows.Media.Effects.DropShadowEffect  5-   "   	   
BlurRadius$	 20Q�63   
   Color$
 	#FFDEDEDE��6C      RenderingBias$ Quality=�6U      ShadowDepth$ 1Q�6m   5/      � 50      $��25q�6   .+�51      � $��30��6#   $��50��6.   ���	#FFFFAF24$
��Left=�6Q   $	��top=�6l   $
��20,0q�6�    52   "     53   &   $	 20Q�67   $
 	#FFECECEC��6G   $ Quality=�6Y   $ 1Q�6q   .+�55   "   '  !MaterialDesignThemes.Wpf.PackIcon  �  �ControlzEx.PackIconBase`1[[MaterialDesignThemes.Wpf.PackIconKind, MaterialDesignThemes.Wpf, Version=2.5.0.1205, Culture=neutral, PublicKeyToken=null]]   Kind$ ContentCopy=�6:   $��Center=�6M   $��Bottom=�6j   $��5q�6�   
�������$��20��6�   $��20��6�   56      �� 57       �� Orientation$ Vertical=�6)   $��center=�6@   $	��Top=�6]   $��
10,55,10,0q�6u   $	��199��6�   $��85��6�   .+�58   "   �� -   5         ��Name$ api_function��58   *   $ ��TIME_SERIES_DAILY_ADJUSTED��6@   $��Center=�6b   $��13(�6}    �� 	IsEnabled .  �� 	UndoLimit$ 97��6�   $��26��6�    � ToolTip$ API function��6�   $
��10,0q�6�   �� 59   "   -   5        $ api_stock_symbol��59   *   $	��VTI��6D   $��Center=�6O   $��13(�6j    . $ 97��6�   $��26��6�   $ stock symbol��6�   $
��10,0q�6�   �� 5:   "   -   5        $ api_output_size��5:   *   $��compact��6C   $��Center=�6R   $��13(�6m    . $ 97��6�   $��26��6�   $ compact or full��6�   $
��10,0q�6�   5;      �� 5<      $ Vertical=�6)   $��right=�6@   $	��top=�6\   $��33��6t   .+�5=   "   �� $��	API Input��6*   $��Center=�6;   $��13(�6V    . $��29��6�   $��57��6�   5>      5?      5@      � 5B      $��1��6   .+�5C      �� $	��150��6$   $��20q�61   
�������$ 10��6J   $ 10��6W    5D        5E   "   $	 20Q�63   $
 	#FFDEDEDE��6C   $ Quality=�6U   $ 1Q�6m   5G      � 5H      $��25q�6   .+�5I      � $��30��6#   $��50��6.   ���	#FFFFAF24$
��Left=�6Q   $	��top=�6l   $
��20,0q�6�    5J   "     5K   &   $	 20Q�67   $
 	#FFECECEC��6G   $ Quality=�6Y   $ 1Q�6q   .+�5M   "     $ ContentCopy=�6:   $��Center=�6M   $��Bottom=�6j   $��5q�6�   
�������$��20��6�   $��20��6�   5N      �� 5O      $��Input��6(   $��Right=�65   $��Chanpagne & Limousines)�6Q   $��5q�6y   
�������6�   �� 5P      $ 
Horizontal=�6)   $��center=�6B   $	��Top=�6_   $��10 20q�6w   .+�5Q   "   �� $��62/13��6*   $��Center=�67   $��20(�6R   5R      5S      5T      � 5W      $��1��6   $��4��6(   $��20,10q�6<    5X      �� 5Y      $��1* �6/   �� 5Z      $��1* �6/    5\      �� 5]      $
��Auto �6,   �� 5^      $��* �6,   .+�5`      � $��0��6   $��0��6,   .+�5a      �� -   5        ���	#FF1565C0��5a   ?   Z� .��5b   "   �� " Toggle zoming mode, current is: �� 5c   "   ��6,   �� *ZoomingMode+ �� 	Converter# [  6|   5d      5e      � 5f      $��0��6   $��1��6,   .+�5g      �� -   5        ���	#FF1565C0��5g   U   Z� .��6l   
Reset Zoom6x   5h      #   LiveCharts.Wpf.CartesianChart  5j      &    LiveCharts.Wpf.Charts.Base.Chart   DisableAnimations . $��1��6�   $��2��6�   ���	#FF232E32   Series 6F   �� *SeriesCollection+   Zoom 6j   �� *ZoomingMode+   AxisX 5l   "      LiveCharts.Wpf.Axis  -   5        $��X��5l   +       LiveCharts.Wpf.DefaultAxes   CleanSeparator   	Separator# Z 5m         LabelFormatter 5l   4   �� *
XFormatter+5m         AxisY 5p   "     -   5        $��Y��5p   +    64   �� *
YFormatter+5r      5s      5u      5v      5x      � 5z   
   $��1��6   ��5{      �� 5|       �� EndPoint$ 0.5,1&�6&    �� 
StartPoint$ 0.5,0&�67   .��5}      �  � Color$ 	LightGray��6#    � Offset$ 1Q�65   � 5~      $ 	#FFE6E6E6��6#   5       5�      �� 5�      $	��100 �6    �� 5�      $��* �6     5�        5�      $	 20Q�6#   $
 	#FFDEDEDE��63   $ Quality=�6E   $ 1Q�6]   .+�5�      � .+�5�      �� $��Solidworks Tracker��6   $��Center=�66   $��Center=�6S   $��16(�6n   5�      �� 5�      $��1��6   .+�5�      �� $��10q�6   ���	#FF344955.��5�      � $	��150��6   .+�5�        $ ViewDashboard=�62   �� 5�      $��Center=�6$   $��Trailing Stop��6A   5�      5�      �� 5�      -   5          ��Name$  
UpdateData��5�      $��10q�6-   ���	#FF344955.��5�      � $	��150��6   .+�5�        $ ChartArc=�62   �� 5�      $��Center=�6$   $��Update Data��6A   5�      5�      5�      5�      � 5�   
   -	   5        ! �Name$! 
GridBarTop��5�      $��2��6#   ���	#FF4A6572.+�5�      �� $ 
Horizontal=�6   $��Right=�62   $
��10,0q�6N   .+�5�      ��  0 ,MaterialDesignFloatingActionMiniAccentButton#��[ 6   $��25��6_   $��25��6j   
���������6v   Z� ��6�   Z� .��5�        $
 Bell=�6.   5�      �� 5�      #��[ 6   $��25��6_   $��25��6j   
���������6v   Z� ��6�   Z� .��5�        $ Account=�6.   5�      �� 5�      -
   5        $
  Exit��5�      #��[ 6'   $��25��6m   $��25��6x   
���������6�   Z� ��6�   Z� .��5�        $ Power=�6.   5�      5�      5�      5�      5�      