using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IDS348_FinalProject.Models
{
    public class Post
    {
        public int PostId { get; set; }
        public int UserId { get; set; }
        public string Text { get; set; }
        public DateTime PublicationDate { get; set; }
        public string UrlContenido { get; set; }
    }

}