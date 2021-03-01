declare default element namespace "urn:isbn:1-931666-22-9";
<collections>
	{
		for $findingaid in collection("/C:/Users/Alex/Desktop/xquery-assignment?select=*.xml")/ead
		let $restrictions := $findingaid/archdesc/accessrestrict/p
		(: Ordered by the physical extent in cubic feet greatest to smallest since volume to me should be calculated in terms of how much space it takes up. Boxes/folders can be bigger or smaller, but cubic/linear feet gives one an exact number. :)
		order by number(substring-before(data($findingaid/archdesc/did/physdesc/extent), ' cubic')) descending
		return
			<findingaid>
				<idno>{data($findingaid/eadheader/eadid/@identifier)}</idno>
				<title>{normalize-space(data($findingaid/eadheader/filedesc/titlestmt/titleproper))}</title>
				<dateSpan unit="years">{number(substring-after($findingaid/eadheader/filedesc/titlestmt/titleproper/date, '-')) - number(substring-before($findingaid/eadheader/filedesc/titlestmt/titleproper/date, '-'))}</dateSpan>
				<encoders>
					{
						for $people in $findingaid/eadheader/filedesc/titlestmt/author[@encodinganalog = 'creator']
						return
							<encoder>{substring-after($people, "by ")}</encoder>
					}
				</encoders>
				<revisions>{count($findingaid/eadheader/revisiondesc/change)}</revisions>
				<physExtent>{data($findingaid/archdesc/did/physdesc/extent)}</physExtent>
<restrictions>{normalize-space(string-join($restrictions, " | "))}</restrictions>
<index_terms>
	{for $terms in $findingaid/archdesc/controlaccess//corpname|$findingaid/archdesc/controlaccess//persname|$findingaid/archdesc/controlaccess//subject
	return 
	<term>{normalize-space(data($terms))}</term>
	}
</index_terms>
<fileCount>{count($findingaid/archdesc/dsc/descendant::*[@level='file'])}</fileCount>
			</findingaid>
	}
</collections>
