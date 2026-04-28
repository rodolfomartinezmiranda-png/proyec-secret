import express from "express";
import bodyParser from "body-parser";
import pg from "pg";
import passport from "passport";
import { Strategy as GoogleStrategy } from "passport-google-oauth20";
import session from "express-session";
import env from "dotenv";

const app = express();
const port = 3000;
env.config();

// 1. Middlewares de Sesión y App
app.use(
  session({
    secret: process.env.SESSION_SECRET,
    resave: false,
    saveUninitialized: true,
    cookie: {
        maxAge: 1000 * 60 * 60 * 24 // 1 día
    }
  })
);

app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static("public"));
app.set("view engine", "ejs");

app.use(passport.initialize());
app.use(passport.session());

// 2. Conexión a PostgreSQL
const db = new pg.Client({
  user: process.env.PG_USER,
  host: process.env.PG_HOST,
  database: process.env.PG_DATABASE,
  password: process.env.PG_PASSWORD,
  port: process.env.PG_PORT,
});
db.connect();

// 3. Estrategia de Google (Aquí se llena la DB)
passport.use(
  "google",
  new GoogleStrategy(
    {
      clientID: process.env.GOOGLE_CLIENT_ID,
      clientSecret: process.env.GOOGLE_CLIENT_SECRET,
      callbackURL: "http://localhost:3000/auth/google/secrets",
      userProfileURL: "https://www.googleapis.com/oauth2/v3/userinfo",
    },
    async (accessToken, refreshToken, profile, cb) => {
      try {
        const userEmail = profile.emails[0].value;
        const googleId = profile.id;

        // Buscamos al usuario
        const result = await db.query("SELECT * FROM users WHERE email = $1", [userEmail]);
        
        if (result.rows.length === 0) {
          // Si no existe, lo insertamos
          const newUser = await db.query(
            "INSERT INTO users (email, google_id) VALUES ($1, $2) RETURNING *",
            [userEmail, googleId]
          );
          return cb(null, newUser.rows[0]);
        } else {
          // Si ya existe, lo devolvemos
          return cb(null, result.rows[0]);
        }
      } catch (err) {
        return cb(err);
      }
    }
  )
);

// 4. Serialización (Vital para que Passport funcione)
passport.serializeUser((user, done) => {
  done(null, user);
});

passport.deserializeUser((user, done) => {
  done(null, user);
});

// 5. Rutas
app.get("/", (req, res) => res.render("home"));
app.get("/login", (req, res) => res.render("login"));
app.get("/register", (req, res) => res.render("register"));

app.get("/auth/google", passport.authenticate("google", { scope: ["profile", "email"] }));

app.get("/auth/google/secrets", 
  passport.authenticate("google", {
    successRedirect: "/secrets",
    failureRedirect: "/login",
  })
);

app.get("/secrets", (req, res) => {
  if (req.isAuthenticated()) {
    res.render("secrets");
  } else {
    res.redirect("/login");
  }
});

app.get("/logout", (req, res) => {
  req.logout((err) => {
    if (err) console.log(err);
    res.redirect("/");
  });
});

app.listen(port, () => {
  console.log(`🚀 Servidor listo en http://localhost:${port}`);
});

