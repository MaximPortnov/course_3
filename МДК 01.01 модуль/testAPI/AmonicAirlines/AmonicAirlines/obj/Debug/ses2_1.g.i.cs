﻿#pragma checksum "..\..\ses2_1.xaml" "{8829d00f-11b8-4213-878b-770e8597ac16}" "9E499F06D85039AE91307E747B556BE6AB9545914CDC666598E40D4932CCB8E6"
//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан программой.
//     Исполняемая версия:4.0.30319.42000
//
//     Изменения в этом файле могут привести к неправильной работе и будут потеряны в случае
//     повторной генерации кода.
// </auto-generated>
//------------------------------------------------------------------------------

using AmonicAirlines;
using System;
using System.Diagnostics;
using System.Windows;
using System.Windows.Automation;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Markup;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Media.Effects;
using System.Windows.Media.Imaging;
using System.Windows.Media.Media3D;
using System.Windows.Media.TextFormatting;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Windows.Shell;


namespace AmonicAirlines {
    
    
    /// <summary>
    /// ses2_1
    /// </summary>
    public partial class ses2_1 : System.Windows.Controls.Page, System.Windows.Markup.IComponentConnector {
        
        
        #line 38 "..\..\ses2_1.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.ComboBox FromBox;
        
        #line default
        #line hidden
        
        
        #line 44 "..\..\ses2_1.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.ComboBox ToBox;
        
        #line default
        #line hidden
        
        
        #line 50 "..\..\ses2_1.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.ComboBox SortByBox;
        
        #line default
        #line hidden
        
        
        #line 69 "..\..\ses2_1.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox OutboundTextBox;
        
        #line default
        #line hidden
        
        
        #line 88 "..\..\ses2_1.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.DataGrid dataGrid;
        
        #line default
        #line hidden
        
        private bool _contentLoaded;
        
        /// <summary>
        /// InitializeComponent
        /// </summary>
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        public void InitializeComponent() {
            if (_contentLoaded) {
                return;
            }
            _contentLoaded = true;
            System.Uri resourceLocater = new System.Uri("/AmonicAirlines;component/ses2_1.xaml", System.UriKind.Relative);
            
            #line 1 "..\..\ses2_1.xaml"
            System.Windows.Application.LoadComponent(this, resourceLocater);
            
            #line default
            #line hidden
        }
        
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Design", "CA1033:InterfaceMethodsShouldBeCallableByChildTypes")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Maintainability", "CA1502:AvoidExcessiveComplexity")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1800:DoNotCastUnnecessarily")]
        void System.Windows.Markup.IComponentConnector.Connect(int connectionId, object target) {
            switch (connectionId)
            {
            case 1:
            this.FromBox = ((System.Windows.Controls.ComboBox)(target));
            
            #line 38 "..\..\ses2_1.xaml"
            this.FromBox.SelectionChanged += new System.Windows.Controls.SelectionChangedEventHandler(this.FromBox_SelectionChanged);
            
            #line default
            #line hidden
            return;
            case 2:
            this.ToBox = ((System.Windows.Controls.ComboBox)(target));
            return;
            case 3:
            this.SortByBox = ((System.Windows.Controls.ComboBox)(target));
            return;
            case 4:
            this.OutboundTextBox = ((System.Windows.Controls.TextBox)(target));
            
            #line 69 "..\..\ses2_1.xaml"
            this.OutboundTextBox.PreviewTextInput += new System.Windows.Input.TextCompositionEventHandler(this.OutboundTextBox_PreviewTextInput);
            
            #line default
            #line hidden
            
            #line 69 "..\..\ses2_1.xaml"
            this.OutboundTextBox.TextChanged += new System.Windows.Controls.TextChangedEventHandler(this.OutboundTextBox_TextChanged);
            
            #line default
            #line hidden
            return;
            case 5:
            
            #line 75 "..\..\ses2_1.xaml"
            ((System.Windows.Controls.TextBox)(target)).PreviewTextInput += new System.Windows.Input.TextCompositionEventHandler(this.TextBox_PreviewTextInput);
            
            #line default
            #line hidden
            return;
            case 6:
            this.dataGrid = ((System.Windows.Controls.DataGrid)(target));
            return;
            }
            this._contentLoaded = true;
        }
    }
}

