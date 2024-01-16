Config = {}

Config.menuLabel        = 'Menu de peds'                                               -- nombre del menú
Config.menuIcon         = 'fas fa-user-tie'                                            -- icono para el menú

Config.optionTitle      = 'Utilizar Ped '                                              -- se concatena con el nombre del ped
Config.optionIcon       = 'fas fa-tshirt'                                              -- icono para cada opción

Config.reloadIcon       = 'fas fa-redo-alt'                                            -- icono para la opción de reload
Config.reloadSkinLabel  = 'Apariencia original'                                        -- titulo de la opción
Config.reloadSkinDesc   = 'Volver a la apariencia original de tu personaje'            -- descripción de la opción
Config.reloadSkinEvent  = 'fivem-appearance:client:reloadSkin'                         -- nombre del evento para reestablecer la skin

Config.errorPermission  = 'No tienes el permiso requerido para utilizar este comando'  -- descripcion del error

Config.Players = {
    ['license:15807baf59dc3feb5a1ca3ee11c3e5e6cd9fdb38'] = {
        { ['name'] = 'Empleado Burgershot (M)', ['ped'] = 'csb_burgerdrug' },
        { ['name'] = 'Civil Mexicano (M)', ['ped'] = 'u_m_y_mani' },
        { ['name'] = 'Ballas (M)', ['ped'] = 'csb_ballasog' },
    }
}
