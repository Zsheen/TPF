
//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------


namespace IDS348_FinalProject
{

using System;
    using System.Collections.Generic;
    
public partial class Save
{

    public int SaveID { get; set; }

    public int UserID { get; set; }

    public int PostID { get; set; }

    public System.DateTime SaveDate { get; set; }



    public virtual Post Post { get; set; }

    public virtual User User { get; set; }

}

}
