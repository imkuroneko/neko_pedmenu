Config = {}

Config.menuLabel        = 'Menu de peds'                                               -- nombre del menú
Config.menuIcon         = 'clothe'                                                     -- icono para cada opción
Config.menuTitle        = 'Utilizar Ped '                                              -- se concatena con el nombre del ped

Config.reloadIcon       = 'redo-alt'                                                   -- icono para la opción de reload
Config.reloadSkinLabel  = 'Apariencia original'                                        -- titulo de la opción
Config.reloadSkinDesc   = 'Volver a la apariencia original de tu personaje'            -- descripción de la opción
Config.reloadSkinEvent  = 'fivem-appearance:client:reloadSkin'                         -- nombre del evento para reestablecer la skin

Config.errorPermission  = 'No tienes el permiso requerido para utilizar este comando'  -- descripcion del error

Config.Players = {
    ['license:333941426721390592'] = {
        { ['name'] = 'ped 1', ['ped'] = 'csb_burgerdrug' },
        { ['name'] = 'ped 2', ['ped'] = 'u_m_y_mani' },
        { ['name'] = 'ped 3', ['ped'] = 'csb_ballasog' },
    }
}