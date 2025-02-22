import { Component, OnInit, Input, Output, EventEmitter, ViewChild } from '@angular/core'                ;
import { Router                                                    } from '@angular/router'              ;
import { SplendidCacheService                                      } from '../../scripts/SplendidCache'  ;
import { CredentialsService                                        } from '../../scripts/Credentials'    ;
import { SecurityService                                           } from '../../scripts/Security'       ;
import { L10nService                                               } from '../../scripts/L10n'           ;
import { CrmConfigService, CrmModulesService                       } from '../../scripts/Crm'            ;
import { ModuleUpdateService                                       } from '../../scripts/ModuleUpdate'   ;
import { HeaderButtonsBase                                         } from '../HeaderButtonsBase'         ;

@Component({
	selector: 'PacificHeaderButtons',
	templateUrl: './HeaderButtons.html',
})
export class PacificHeaderButtons extends HeaderButtonsBase implements OnInit
{
	constructor(public router: Router, public SplendidCache : SplendidCacheService, public Credentials : CredentialsService, public Security : SecurityService, public L10n : L10nService, public Crm_Config : CrmConfigService, public Crm_Modules : CrmModulesService, public ModuleUpdate: ModuleUpdateService)
	{
		super(router, SplendidCache, Credentials, Security, L10n, Crm_Config, Crm_Modules, ModuleUpdate);
		//console.log(this.constructor.name + '.constructor', this.MODULE_NAME);
	}

	ngOnInit()
	{
	}

	ngDoCheck() : void
	{
	}
}
