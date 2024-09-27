using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IDS348_FinalProject.Models
{
    public class Comment
    {
        public int CommentId { get; set; }

        public int PostId { get; set; }

        public int UserId { get; set; }

        public DateTime CommentDate { get; set; }

        public string CommentText { get; set; } = null;
    }
}