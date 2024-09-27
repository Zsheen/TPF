using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IDS348_FinalProject.Models
{
    public class Like
    {
        public int LikeId { get; set; }

        public int UserId { get; set; }

        public int LikedEntityId { get; set; }

        public string LikedEntityType { get; set; } = null;

        public DateTime LikeDate { get; set; }
    }
}