<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<wps:Capabilities xmlns:ows="http://www.opengis.net/ows/1.1" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:wps="http://www.opengis.net/wps/1.0.0" xml:lang="en-US" service="WPS" updateSequence="1" version="1.0.0">
	<ows:ServiceIdentification>
		<ows:Title>ICPAC WPS</ows:Title>
		<ows:Abstract>This service uses GSKY - A Scalable, Distributed Geospatial Data Service.</ows:Abstract>
		<ows:Keywords>
			<ows:Keyword>WPS</ows:Keyword>
			<ows:Keyword>GIS</ows:Keyword>
			<ows:Keyword>Geoprocessing</ows:Keyword>
			<ows:Keyword>Geospatial Data</ows:Keyword>
		</ows:Keywords>
		<ows:ServiceType>WPS</ows:ServiceType>
		<ows:ServiceTypeVersion>1.0.0</ows:ServiceTypeVersion>
	        <ows:Fees>None</ows:Fees>
		<ows:AccessConstraints>None</ows:AccessConstraints>
	</ows:ServiceIdentification>
	<ows:ServiceProvider>
		<ows:ProviderName>ICPAC</ows:ProviderName>
		<ows:ProviderSite xlink:href="https://icpac.net"/>
		<ows:ServiceContact>
			<ows:IndividualName>ICPAC Developers</ows:IndividualName>
			<ows:PositionName>East Africa Hazards Watch</ows:PositionName>
			<ows:ContactInfo>
				<ows:Phone>
					<ows:Voice>020 3514426</ows:Voice>
				</ows:Phone>
				<ows:Address>
					<ows:DeliveryPoint>IGAD Climate Prediction and Applications Centre (ICPAC) </ows:DeliveryPoint>
					<ows:City>Nairobi</ows:City>
					<ows:AdministrativeArea>Nairobi</ows:AdministrativeArea>
					<ows:PostalCode>10304-00100</ows:PostalCode>
					<ows:Country>Kenya</ows:Country>
					<ows:ElectronicMailAddress>communication@icpac.net</ows:ElectronicMailAddress>
				</ows:Address>
			</ows:ContactInfo>
		</ows:ServiceContact>
	</ows:ServiceProvider>
	<ows:OperationsMetadata>
		<ows:Operation name="GetCapabilities">
			<ows:DCP>
				<ows:HTTP>
					<ows:Get xlink:href="{{ .ServiceConfig.OWSProtocol }}://{{ .ServiceConfig.OWSHostname }}/ows"/>
				</ows:HTTP>
			</ows:DCP>
		</ows:Operation>
		<ows:Operation name="DescribeProcess">
			<ows:DCP>
				<ows:HTTP>
					<ows:Get xlink:href="{{ .ServiceConfig.OWSProtocol }}://{{ .ServiceConfig.OWSHostname }}/ows"/>
				</ows:HTTP>
			</ows:DCP>
		</ows:Operation>
		<ows:Operation name="Execute">
			<ows:DCP>
				<ows:HTTP>
					<ows:Get xlink:href="{{ .ServiceConfig.OWSProtocol }}://{{ .ServiceConfig.OWSHostname }}/ows"/>
				</ows:HTTP>
			</ows:DCP>
		</ows:Operation>
	</ows:OperationsMetadata>
	<wps:ProcessOfferings>
		{{ range $index, $value := .Processes }}
		<wps:Process wps:processVersion="1.0.0">
			<ows:Identifier>{{ .Identifier }}</ows:Identifier>
			<ows:Title>{{ .Title }}</ows:Title>
			<ows:Abstract>{{ .Abstract }}</ows:Abstract>
			<ows:Metadata xlink:title="Time Series Extractor"/>
		</wps:Process>
		{{ end }}
	</wps:ProcessOfferings>
	<wps:Languages>
		<wps:Default>
			<ows:Language>en-US</ows:Language>
		</wps:Default>
		<wps:Supported>
			<ows:Language>en-US</ows:Language>
		</wps:Supported>
	</wps:Languages>
</wps:Capabilities>