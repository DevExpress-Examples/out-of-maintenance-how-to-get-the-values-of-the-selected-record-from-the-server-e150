<%-- BeginRegion TagPrefix and page properties --%>
<%@ Page Language="vb" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="Advanced_CheckBox_Selection" ValidateRequest="false"%>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.1" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v8.1" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%-- EndRegion --%>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
	<title>How to get the values of the selected record from the server</title>
<script type="text/javascript">
	function SelChanged(s, e) {
		if(!e.isSelected) {
		selDescription.SetValue("The record was unselected");
		} else {
			grid.GetRowValues(e.visibleIndex, 'CustomerID;EmployeeID;OrderDate;RequiredDate;ShippedDate;ShipVia;Freight;ShipName;ShipAddress;ShipCity', OnGridSelectionComplete);
		}
	}
	function OnGridSelectionComplete(values) {
		var str = "Customer Id: " + values[0] + ", Employee Id: " + values[1] + ", Order Date: " + values[2] + 
			", Required Date: " + values[3] + ", Shipped Date: " + values[4] + ", Ship Via: "  + values[5] + 
			", Freight: " + values[6] + ", Ship Name: " + values[7] + ", Ship Address: " + values[8] + 
			", Ship City: " + values[9];
		selDescription.SetValue(str);
	}
</script>    
</head>
<body>
	<form id="form1" runat="server">

	The following record has been selected:
	<dxe:ASPxMemo ID="selDescription" runat="server" EnableClientSideAPI="true"  Height="100px" Width="700px" />
	<br />
	<dxwgv:ASPxGridView ID="grid" runat="server" AutoGenerateColumns="False" Width="700px"
			DataSourceID="AccessDataSource1" KeyFieldName="OrderID">
			<Columns>
				<dxwgv:GridViewCommandColumn ShowSelectCheckbox="True" VisibleIndex="0">
				</dxwgv:GridViewCommandColumn>
				<dxwgv:GridViewDataTextColumn FieldName="OrderID" ReadOnly="True" VisibleIndex="1">
				</dxwgv:GridViewDataTextColumn>
				<dxwgv:GridViewDataDateColumn FieldName="OrderDate" VisibleIndex="2">
				</dxwgv:GridViewDataDateColumn>
				<dxwgv:GridViewDataTextColumn FieldName="ShipVia" VisibleIndex="3">
				</dxwgv:GridViewDataTextColumn>
				<dxwgv:GridViewDataTextColumn FieldName="Freight" VisibleIndex="4">
				</dxwgv:GridViewDataTextColumn>
				<dxwgv:GridViewDataTextColumn FieldName="ShipName" VisibleIndex="5">
				</dxwgv:GridViewDataTextColumn>
				<dxwgv:GridViewDataTextColumn FieldName="ShipRegion" VisibleIndex="6">
				</dxwgv:GridViewDataTextColumn>
				<dxwgv:GridViewDataTextColumn FieldName="ShipPostalCode" VisibleIndex="7">
				</dxwgv:GridViewDataTextColumn>
				<dxwgv:GridViewDataTextColumn FieldName="ShipCountry" VisibleIndex="8">
				</dxwgv:GridViewDataTextColumn>
			</Columns>
			<Settings ShowGroupPanel="True"  />
		<ClientSideEvents SelectionChanged="function(s, e) { SelChanged(s, e); }" />
		</dxwgv:ASPxGridView>
		<asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/nwind.mdb"
			SelectCommand="SELECT [OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry] FROM [Orders]">
		</asp:AccessDataSource>
	</form>
</body>
</html>