using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IDS348_FinalProject.Models
{
    public class User
    {
        public int UserId { get; set; }
        public string UserName { get; set; } = null;
        public string Names { get; set; } = null;
        public string Passwords { get; set; } = null;
        public string ProfilePhoto { get; set; } = null;
        public string Email { get; set; } = null;
        public string Phone { get; set; } = null;
        public DateTime CreationDate { get; set; }
        public DateTime Birthday { get; set; }
        public string Biography { get; set; } = null;
        public string PlaceWhereLives { get; set; } = null;
        public string Sex { get; set; } = null;
        public string Verified { get; set; } = null;
    }
}