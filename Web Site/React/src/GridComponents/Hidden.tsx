/*
 * Copyright (C) 2005-2022 SplendidCRM Software, Inc. 
 * MIT License
 * Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation 
 * files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, 
 * modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software 
 * is furnished to do so, subject to the following conditions:
 * The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 */

// 1. React and fabric. 
import * as React from 'react';
// 2. Store and Types. 
// 3. Scripts. 
import Sql from '../scripts/Sql';
// 4. Components and Views. 

interface IHiddenProps
{
	baseId: string;
	row   : any;
	layout: any;
}

class Hidden extends React.PureComponent<IHiddenProps>
{
	public render()
	{
		const { baseId, layout, row } = this.props;
		let DATA_FIELD = Sql.ToString(layout.DATA_FIELD);
		let sKEY = baseId + '_' + DATA_FIELD;
		if ( layout == null )
		{
			return (<div>layout prop is null</div>);
		}
		else if ( Sql.IsEmptyString(DATA_FIELD) )
		{
			return (<div>DATA_FIELD is empty for FIELD_INDEX {layout.FIELD_INDEX}</div>);
		}
		else
		{
			var sVALUE = (row ? Sql.ToString(row[DATA_FIELD]) : '');
			// 06/16/2022 Paul.  This code is never reached, but correct to hide the data. 
			return (<div id={sKEY} key={sKEY} style={ {display: 'none'} }>{sVALUE}</div>);
		}
	}
}

export default Hidden;
